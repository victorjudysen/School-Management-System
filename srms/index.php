<?php
session_start();
error_reporting(0);
include('includes/config.php');

if ($_SESSION['alogin'] != '') {
    $_SESSION['alogin'] = '';
}

if (isset($_POST['login'])) {
    $uname = $_POST['username'];
    $password = $_POST['password']; // No hashing here

    // Checking for admin login
    $sqlAdmin = "SELECT UserName, Password FROM tbladmin WHERE UserName = :uname";
    $queryAdmin = $dbh->prepare($sqlAdmin);
    $queryAdmin->bindParam(':uname', $uname, PDO::PARAM_STR);
    $queryAdmin->execute();
    $resultAdmin = $queryAdmin->fetch(PDO::FETCH_OBJ);

    if ($resultAdmin) {
        if (password_verify($password, $resultAdmin->Password)) {
            $_SESSION['alogin'] = $uname;
            echo "<script type='text/javascript'> document.location = 'admin-dashboard.php'; </script>";
        } else {
            echo "<script>alert('Invalid Details');</script>";
        }
    } else {
        // Checking for staff login
        $sqlStaff = "SELECT UserName, Password FROM staff WHERE UserName = :uname";
        $queryStaff = $dbh->prepare($sqlStaff);
        $queryStaff->bindParam(':uname', $uname, PDO::PARAM_STR);
        $queryStaff->execute();
        $resultStaff = $queryStaff->fetch(PDO::FETCH_OBJ);

        if ($resultStaff) {
            if (password_verify($password, $resultStaff->Password)) {
                $_SESSION['alogin'] = $uname;
                echo "<script type='text/javascript'> document.location = 'dashboard.php'; </script>";
            } else {
                echo "<script>alert('Invalid Details');</script>";
            }
        } else {
            echo "<script>alert('Invalid Details');</script>";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>School Management System</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
    <link rel="stylesheet" href="css/prism/prism.css" media="screen"> <!--USED FOR DEMO HELP - YOU CAN REMOVE IT-->
    <link rel="stylesheet" href="css/main.css" media="screen">
    <style>
        .btn-primary {
            background-color: black;
            color: white;
            border-color: white;
        }
    </style>
    <script src="js/modernizr/modernizr.min.js"></script>
</head>
<body class="">
<div class="main-wrapper">
    <div class="">
        <div class="row">
            <h1 align="center">School Management System</h1>
            <div class="col-lg-6 visible-lg-block">
                <section class="section">
                    <div class="row mt-40">
                        <div class="col-md-10 col-md-offset-1 pt-50">
                            <div class="row mt-30">
                                <div class="col-md-11">
                                    <div class="panel">
                                        <div class="panel-heading">
                                            <div class="panel-title text-center">
                                                <h4>For Parents</h4>
                                            </div>
                                        </div>
                                        <div class="panel-body p-20">
                                            <div class="section-title">
                                                <p class="sub-title">Dear Parent, Please use your child's full name and your password to access the results.</p>
                                            </div>
                                            <form class="form-horizontal" method="post">
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-6 control-label">Proceed Here:</label>
                                                    <div class="col-sm-6">
                                                        <button class="btn btn-primary" style="background-color: #5cb85c;"><a href="find-result.php" style="color: white;">Access Results</a></button>

                                                        <div style="margin-top: 10px;">
                                                            <button class="btn btn-primary" style="background-color: #5cb85c;"><a href="signup.php" style="color: white;">Sign Up</a></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="col-lg-6">
                <section class="section">
                    <div class="row mt-40">
                        <div class="col-md-10 col-md-offset-1 pt-50">
                            <div class="row mt-30">
                                <div class="col-md-11">
                                    <div class="panel">
                                        <div class="panel-heading">
                                            <div class="panel-title text-center">
                                                <h4>For Staff</h4>
                                            </div>
                                        </div>
                                        <div class="panel-body p-20">
                                            <div class="section-title">
                                                <p class="sub-title">School Management System</p>
                                            </div>
                                            <form class="form-horizontal" method="post">
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" name="username" class="form-control" id="inputEmail3" placeholder="Username">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                                                    <div class="col-sm-10">
                                                        <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="Password">
                                                    </div>
                                                </div>
                                                <div class="form-group mt-20">
                                                    <div class="col-sm-offset-2 col-sm-10">
                                                        <button type="submit" name="login" class="btn btn-success btn-labeled pull-right">Sign in<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <p class="text-muted text-center"><small>Copyright © SMS | Courtesy of Group 05, Year 02 - Bsc. Software Engineering</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>
<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>

<!-- ========== PAGE JS FILES ========== -->

<!-- ========== THEME JS ========== -->
<script src="js/main.js"></script>
<script>
    $(function(){

    });
</script>

<!-- ========== ADD custom.js FILE BELOW WITH YOUR CHANGES ========== -->
</body>
</html>
