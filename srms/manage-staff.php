<?php
session_start();
error_reporting(0);
include('includes/config.php');

if(isset($_GET['delid'])){
    $delid = $_GET['delid'];
    $sql = "DELETE FROM staff WHERE id = :delid";
    $query = $dbh -> prepare($sql);
    $query ->bindParam(':delid', $delid, PDO::PARAM_STR);
    $query -> execute();
    if($query->rowCount() > 0){
        echo "<script>alert('Staff Deleted Successfully!');</script>";
    } else{
        echo "<script>alert('Staff Not Found!');</script>";
    }
    echo "<script>window.location.href = 'manage-staff.php'</script>";
}

if(strlen($_SESSION['alogin'])==""){
    header("Location: index.php"); 
} else {
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin | Manage Staff</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
        <link rel="stylesheet" type="text/css" href="js/DataTables/datatables.min.css"/>
        <link rel="stylesheet" href="css/main.css" media="screen" >
        <script src="js/modernizr/modernizr.min.js"></script>
        <style>
        .errorWrap {
            padding: 10px;
            margin: 0 0 20px 0;
            background: #fff;
            border-left: 4px solid #dd3d36;
            -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
            box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
        }
        .succWrap{
            padding: 10px;
            margin: 0 0 20px 0;
            background: #fff;
            border-left: 4px solid #5cb85c;
            -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
            box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
        }
        </style>
    </head>
    <body class="top-navbar-fixed">
        <div class="main-wrapper">

            <!-- ========== TOP NAVBAR ========== -->
            <?php include('includes/admin-topbar.php');?> 
            <!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
            <div class="content-wrapper">
                <div class="content-container">
                    <?php include('includes/admin-leftbar.php');?>  

                    <div class="main-page">
                        <div class="container-fluid">
                            <div class="row page-title-div">
                                <div class="col-md-6">
                                    <h2 class="title">Manage Staff</h2>
                                </div>
                            </div>
                            <div class="row breadcrumb-div">
                                <div class="col-md-6">
                                    <ul class="breadcrumb">
                                        <li><a href="dashboard.php"><i class="fa fa-home"></i> Home</a></li>
                                        <li> Staff</li>
                                        <li class="active">Manage Staff</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <section class="section">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel">
                                            <div class="panel-heading">
                                                <div class="panel-title">
                                                    <h5>View Staff Information</h5>
                                                </div>
                                            </div>

                                            <div class="panel-body p-20">
                                                <table id="example" class="display table table-striped table-bordered" cellspacing="0" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Full Name</th>
                                                            <th>Email</th>
                                                            <th>Subject</th>
                                                            <th>Gender</th>
                                                            <th>Phone Number</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
<?php 
$sql = "SELECT * from staff";
$query = $dbh->prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0){
    foreach($results as $result){   ?>
    <tr>
        <td><?php echo htmlentities($cnt);?></td>
        <td><?php echo htmlentities($result->UserName);?></td>
        <td><?php echo htmlentities($result->Email);?></td>
        <td><?php echo htmlentities($result->Subject);?></td>
        <td><?php echo htmlentities($result->Gender);?></td>
        <td><?php echo htmlentities($result->Phone);?></td>
        <td>
            <!-- <a href="edit-staff.php?stid=<?php echo htmlentities($result->id);?>"><i class="fa fa-edit" title="Edit Record"></i> </a> ||  --> --- 
            <a href="manage-staff.php?delid=<?php echo ($result->id);?>" onclick="return confirm('Do you really want to Delete ?');"><i class="fa fa-trash-o"></i></a>
            ---
        </td>
    </tr>
<?php $cnt=$cnt+1;}} ?>
                                                    </tbody>
                                                </table>
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
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/pace/pace.min.js"></script>
        <script src="js/lobipanel/lobipanel.min.js"></script>
        <script src="js/iscroll/iscroll.js"></script>

        <!-- ========== PAGE JS FILES ========== -->
        <script src="js/prism/prism.js"></script>
        <script src="js/DataTables/datatables.min.js"></script>

        <!-- ========== THEME JS ========== -->
        <script src="js/main.js"></script>
        <script>
            $(function($) {
                $('#example').DataTable();

                $('#example2').DataTable( {
                    "scrollY":        "300px",
                    "scrollCollapse": true,
                    "paging":         false
                } );

                $('#example3').DataTable();
            });
        </script>
    </body>
</html>
<?php } ?>
