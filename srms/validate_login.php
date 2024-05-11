<?php
session_start();
error_reporting(0);
include('includes/config.php');

if(isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Fetch user record from the database based on the username (student's surname)
    $sql = "SELECT * FROM tblstudents WHERE StudentName = :username";
    $query = $dbh->prepare($sql);
    $query->bindParam(':username', $username, PDO::PARAM_STR);
    $query->execute();
    $result = $query->fetch(PDO::FETCH_ASSOC);

    if($result !== false && password_verify($password, $result['Password'])) {
        // Username and password are correct, set session variables and redirect to the results page
        $_SESSION['student_id'] = $result['StudentId'];
        $_SESSION['student_name'] = $result['StudentName'];
        $_SESSION['class_id'] = $result['ClassId'];
        $_SESSION['logged_in'] = true;
        header('Location: result.php');
        exit;
    } else {
        // Invalid username or password, redirect back to the login page with an error message
        $_SESSION['error'] = 'Invalid username or password';
        header('Location: find_results.php');
        exit;
    }
} else {
    // Redirect back to the login page if the form was not submitted properly
    header('Location: find_results.php');
    exit;
}
?>