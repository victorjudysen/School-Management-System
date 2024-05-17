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
    <link rel="stylesheet" href="css/main.css" media="screen">
    <script src="js/modernizr/modernizr.min.js"></script>
</head>
<body class="top-navbar-fixed">
    <div class="main-wrapper">
        <?php include('includes/topbar.php');?>
        <div class="content-wrapper">
            <div class="content-container">
                <?php include('includes/leftbar.php');?>
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
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat bg-primary" href="manage-staff.php">
                                        <!-- You can use PHP to fetch and display data -->
                                        <span class="number counter">5</span>
                                        <span class="name">Total Staff</span>
                                        <span class="bg-icon"><i class="fa fa-users"></i></span>
                                    </a>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat bg-danger" href="manage-parents.php">
                                        <!-- You can use PHP to fetch and display data -->
                                        <span class="number counter">20</span>
                                        <span class="name">Total Parents</span>
                                        <span class="bg-icon"><i class="fa fa-users"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/jquery-ui/jquery-ui.min.js"></script>
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <script src="js/pace/pace.min.js"></script>
    <script src="js/lobipanel/lobipanel.min.js"></script>
    <script src="js/iscroll/iscroll.js"></script>
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
    <script src="js/main.js"></script>
    <script src="js/production-chart.js"></script>
    <script src="js/traffic-chart.js"></script>
    <script src="js/task-list.js"></script>
    <script>
        $(function(){
            $('.counter').counterUp({
                delay: 100,
                time: 1000
            });

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
            toastr["success"]("Welcome to Admin Dashboard!");
        });
    </script>
</body>
<div class="foot"><footer>
<p> Courtesy of Group 05 - Bsc. Software Engineering Year 02</a>
</footer> </div>

<style> .foot{text-align: center; */}</style>
</html>
