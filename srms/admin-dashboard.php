<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])=="") 
    {
    header("Location: index.php");
    } else {
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen">
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css">
    <link rel="stylesheet" href="css/icheck/skins/line/red.css">
    <link rel="stylesheet" href="css/icheck/skins/line/green.css">
    <link rel="stylesheet" href="css/main.css" media="screen">
    <script src="js/modernizr/modernizr.min.js"></script>
</head>
<body class="top-navbar-fixed">
    <div class="main-wrapper">
        <?php include('includes/topbar.php');?>
        <div class="content-wrapper">
            <div class="content-container">
            <?php include('includes/admin-leftbar.php'); ?>

                <div class="main-page">
                    <div class="container-fluid">
                        <div class="row page-title-div">
                            <div class="col-sm-6">
                                <h2 class="title">Admin Dashboard</h2>
                            </div>
                        </div>
                    </div>

                    <section class="section">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a data-toggle="tab" href="#staff">Staff</a></li>
                                        <li><a data-toggle="tab" href="#parents">Parents</a></li>
                                    </ul>

                                    <div class="tab-content">
                                        <div id="staff" class="tab-pane fade in active">
                                            <h3>Staff Members</h3>
                                            <?php
                                            $sql = "SELECT UserName, Email FROM staff";
                                            $query = $dbh->prepare($sql);
                                            $query->execute();
                                            $results = $query->fetchAll(PDO::FETCH_OBJ);
                                            if($query->rowCount() > 0) {
                                                echo '<table class="table table-striped">';
                                                echo '<thead><tr><th>Username</th><th>Email</th></tr></thead>';
                                                echo '<tbody>';
                                                foreach($results as $result) {
                                                    echo '<tr>';
                                                    echo '<td>' . htmlentities($result->UserName) . '</td>';
                                                    echo '<td>' . htmlentities($result->Email) . '</td>';
                                                    echo '</tr>';
                                                }
                                                echo '</tbody></table>';
                                            } else {
                                                echo '<p>No staff members found.</p>';
                                            }
                                            ?>
                                        </div>

                                        <div id="parents" class="tab-pane fade">
                                            <h3>Parents</h3>
                                            <?php
                                            $sql = "SELECT UserName, Email FROM parents";
                                            $query = $dbh->prepare($sql);
                                            $query->execute();
                                            $results = $query->fetchAll(PDO::FETCH_OBJ);
                                            if($query->rowCount() > 0) {
                                                echo '<table class="table table-striped">';
                                                echo '<thead><tr><th>Username</th><th>Email</th></tr></thead>';
                                                echo '<tbody>';
                                                foreach($results as $result) {
                                                    echo '<tr>';
                                                    echo '<td>' . htmlentities($result->UserName) . '</td>';
                                                    echo '<td>' . htmlentities($result->Email) . '</td>';
                                                    echo '</tr>';
                                                }
                                                echo '</tbody></table>';
                                            } else {
                                                echo '<p>No parents found.</p>';
                                            }
                                            ?>
                                        </div>
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
    <script src="js/prism/prism.js"></script>
    <script src="js/waypoint/waypoints.min.js"></script>
    <script src="js/counterUp/jquery.counterup.min.js"></script>
    <script src="js/amcharts/amcharts.js"></script>
    <script src="js/amcharts/serial.js"></script>
    <script src="js/amcharts/plugins/export/export.min.js"></script>
    <link rel="stylesheet" href="js/amcharts/plugins/export/export.css" type="text/css" media="all" />
    <script src="js/amcharts/themes/light.js"></script>
    <script src="js/toastr/toastr.min.js"></script>
    <script src="js/icheck/icheck.min.js"></script>

    <!-- ========== THEME JS ========== -->
    <script src="js/main.js"></script>
    <script src="js/production-chart.js"></script>
    <script src="js/traffic-chart.js"></script>
    <script src="js/task-list.js"></script>
    <script>
        $(function(){
            // Counter for dashboard stats
            $('.counter').counterUp({
                delay: 100,
                time: 1000
            });

            // Welcome notification
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": false,
                "positionClass": "toast-top-right",
                "preventDuplicates": false,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
            toastr["success"]( "Welcome to the Admin Dashboard!");
        });
    </script>
</body>

<div class="foot">
    <footer>
        <p> Courtesy of Group 05 - Bsc. Software Engineering Year 02</a></p>
    </footer>
</div>

<style> 
.foot { text-align: center; } 
</style>
</html>
<?php } ?>