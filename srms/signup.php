<?php
// Database connection
include('includes/config.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['childName'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
    // $studentName = $_POST['studentName'];
    $studentClass = $_POST['studentClass'];

    $sql = "INSERT INTO parents (UserName, Email, Password, StudentClass) VALUES (:username, :email, :password, :studentClass)";
    $query = $dbh->prepare($sql);
    $query->bindParam(':username', $username, PDO::PARAM_STR);
    $query->bindParam(':email', $email, PDO::PARAM_STR);
    $query->bindParam(':password', $password, PDO::PARAM_STR);
    // $query->bindParam(':studentName', $studentName, PDO::PARAM_STR);
    $query->bindParam(':studentClass', $studentClass, PDO::PARAM_STR);
    
    if ($query->execute()) {
        echo "Parent signed up successfully.";
    } else {
        echo "Error: Could not sign up parent.";
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
            
            <label for="inputChildName" class="sr-only">Child's Name</label>
            <input type="text" id="inputChildName" class="form-control" placeholder="Child's Name" name="childName" required autofocus>
            
            <label for="email" class="sr-only">Email</label>
            <input type="email" id="email" class="form-control" placeholder="Parent's Email" name="email" required>
            
            <label for="studentClass" class="sr-only">Student Class</label>
            <input type="text" id="studentClass" class="form-control" placeholder="Form [X] Stream [Y]" name="studentClass" required>

            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
            
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign Up</button>
        </form>
    </div>
</body>
</html>
