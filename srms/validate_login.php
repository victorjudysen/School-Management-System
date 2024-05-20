<?php
session_start();
include('includes/config.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $childName = $_POST['username'];
    $password = $_POST['password'];

    // Hash the password for comparison
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // Prepare and execute the SQL query
    $sql = "SELECT * FROM parents WHERE UserName = :childName";
    $query = $dbh->prepare($sql);
    $query->bindParam(':childName', $childName, PDO::PARAM_STR);
    $query->execute();

    // Fetch the user record
    $user = $query->fetch(PDO::FETCH_ASSOC);

    // Verify password and handle login
    if ($user && password_verify($password, $user['Password'])) {
        $_SESSION['child_name'] = $childName;
        header("Location: result.php");
        exit;
    } else {
        echo "<script>alert('Invalid Details');</script>";
        echo "<script type='text/javascript'> document.location = 'find-result.php'; </script>";
    }
}
?>
