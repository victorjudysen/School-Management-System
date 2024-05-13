<?php
// Include database configuration and helper functions
include('includes/config.php');

// Function to generate a random temporary password
function generatePassword($length = 8) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $password = '';
    for ($i = 0; $i < $length; $i++) {
        $password .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $password;
}

// Function to send email
function sendEmail($to, $subject, $message) {
    // You need to configure email settings here, such as SMTP server, username, password, etc.
    // For simplicity, we'll use PHP's built-in mail function
    return mail($to, $subject, $message);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get parent's input
    $childName = $_POST['childName'];
    $parentEmail = $_POST['parentEmail'];

    // Generate a temporary password
    $tempPassword = generatePassword();

    // Send email with temporary password
    $subject = "Your temporary password for School Management System";
    $message = "Hello,\n\nYour temporary password for accessing your child's results in the School Management System is: $tempPassword\n\nPlease use your child's full name and this password to login.\n\nBest regards,\nSchool Management Team";
    $emailSent = sendEmail($parentEmail, $subject, $message);

    // Store temporary password in the database
    if ($emailSent) {
        // Insert data into database
        try {
            $sql = "INSERT INTO parent_temp_password (child_name, parent_email, temp_password) VALUES (:childName, :parentEmail, :tempPassword)";
            $stmt = $dbh->prepare($sql);
            $stmt->bindParam(':childName', $childName, PDO::PARAM_STR);
            $stmt->bindParam(':parentEmail', $parentEmail, PDO::PARAM_STR);
            $stmt->bindParam(':tempPassword', $tempPassword, PDO::PARAM_STR);
            $stmt->execute();
            // Redirect to success page or login page
            header("Location: signup_success.php");
            exit;
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
    } else {
        $errorMsg = "Failed to send email. Please try again.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        body {
            padding-top: 50px;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Make the body full height */
        }

        .form-signup {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            animation: fade-in 0.5s ease forwards, scale-in 0.5s ease forwards;
        }
        @keyframes fade-in {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        @keyframes scale-in {
            from {
                transform: scale(0.5);
            }
            to {
                transform: scale(1);
            }
        }
        .form-signup-heading {
            margin-bottom: 20px;
            text-align: center;
            color: #333;
            animation: slide-in 0.5s ease forwards;
        }
        @keyframes slide-in {
            from {
                transform: translateY(-50%);
            }
            to {
                transform: translateY(0);
            }
        }
        .form-signup .form-control {
            position: relative;
            box-sizing: border-box;
            height: auto;
            padding: 10px;
            font-size: 16px;
            margin-bottom: 15px; /* Add spacing between input fields */
        }
        .btn-primary {
            background-color: #5cb85c;
            border-color: #4cae4c;
            transition: background-color 0.3s, border-color 0.3s;
            animation: pulse 1s infinite alternate; /* Add pulse animation */
        }
        .btn-primary:hover {
            background-color: #4cae4c;
            border-color: #4cae4c;
        }
        @keyframes pulse {
            from {
                transform: scale(1);
            }
            to {
                transform: scale(1.05);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <form class="form-signup" method="post">
            <h2 class="form-signup-heading">Welcome, Sign Up!</h2>
            <?php if (isset($errorMsg)) { ?>
                <div class="alert alert-danger" role="alert"><?php echo $errorMsg; ?></div>
            <?php } ?>
            <label for="inputChildName" class="sr-only">Child's Name</label>
            <input type="text" id="inputChildName" class="form-control" placeholder="Child's Name" name="childName" required autofocus>
            <label for="inputParentEmail" class="sr-only">Parent's Email</label>
            <input type="email" id="inputParentEmail" class="form-control" placeholder="Parent's Email" name="parentEmail" required>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign Up</button>
        </form>
    </div>
</body>
</html>
