<?php
// Define the password to be hashed
$password = 'prof.msele';

// Hash the password
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// Output the hashed password
echo "Hashed password: $hashed_password";
?>
