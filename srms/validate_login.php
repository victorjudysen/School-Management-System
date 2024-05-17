<?php
session_start();
include('includes/config.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $childName = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM parent_temp_password WHERE child_name = :childName AND temp_password = :password";
    $query = $dbh->prepare($sql);
    $query->bindParam(':childName', $childName, PDO::PARAM_STR);
    $query->bindParam(':password', $password, PDO::PARAM_STR);
    $query->execute();

    if ($query->rowCount() > 0) {
        $_SESSION['child_name'] = $childName;
        header("Location: result.php");
        exit;
    } else {
        echo "<script>alert('Invalid Details');</script>";
        echo "<script type='text/javascript'> document.location = 'find-result.php'; </script>";
    }
}
?>
