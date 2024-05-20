<?php
session_start();
error_reporting(0);
include('includes/config.php');
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
    <link rel="stylesheet" href="css/icheck/skins/flat/blue.css">
    <link rel="stylesheet" href="css/main.css" media="screen">
    <script src="js/modernizr/modernizr.min.js"></script>
</head>

<body class="">

<div class="main-wrapper">

    <div class="login-bg-color bg-black-300">

        <div class="row">

            <div class="col-md-4 col-md-offset-4">

                <div class="panel login-box">

                    <div class="panel-heading">
                        <div class="panel-title text-center">
                            <h4>School Management System</h4>
                            <img src="images/udom_logo.png" width="80px" height="80px" alt="logo" align="center">
                        </div>
                    </div>

                    <div class="panel-body p-20">
                        <form action="validate_login.php" method="post">
                            <div class="form-group">
                                <label for="username">Student's Name:</label>
                                <input type="text" class="form-control" id="username" placeholder="Student's Name" autocomplete="off" name="username">
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" class="form-control" id="password" placeholder="Password" autocomplete="off" name="password">
                            </div>

                            <div class="form-group mt-20">
                                <div class="">
                                    <button type="submit" class="btn btn-success btn-labeled pull-right">Login<span class="btn-label btn-label-right"><i class="fa fa-check"></i></span></button>
                                    <div class="clearfix"></div>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <button>
                                    <a href="index.php">Back Home</a>
                                </button>
                            </div>

                        </form>
                    </div>
                </div>
                <p class="text-muted text-center"><small>Copyright © SMS | Courtesy of Group 05, Year 02 - Bsc. Software Engineering</small></p>
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
        <script src="js/icheck/icheck.min.js"></script>

        <!-- ========== THEME JS ========== -->
        <script src="js/main.js"></script>
        <script>
            $(function(){
                $('input.flat-blue-style').iCheck({
                    checkboxClass: 'icheckbox_flat-blue'
                });
            });
        </script>



