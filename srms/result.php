<?php
session_start();
error_reporting(0);
include('includes/config.php');

if (!isset($_SESSION['child_name'])) {
    header("Location: find-result.php");
    exit;
}

$childName = $_SESSION['child_name'];

// Query to fetch student details based on child's name
$sql = "SELECT StudentId, StudentName FROM tblstudents WHERE StudentName = :childName";
$query = $dbh->prepare($sql);
$query->bindParam(':childName', $childName, PDO::PARAM_STR);
$query->execute();
$student = $query->fetch(PDO::FETCH_OBJ);

if ($student) {
    $studentId = $student->StudentId;
    $studentName = $student->StudentName;

    // Query to fetch student results
    $sql = "SELECT tblsubjects.SubjectName, tblresult.marks 
            FROM tblresult 
            JOIN tblsubjects ON tblresult.SubjectId = tblsubjects.id 
            WHERE tblresult.StudentId = :studentId";
    $query = $dbh->prepare($sql);
    $query->bindParam(':studentId', $studentId, PDO::PARAM_STR);
    $query->execute();
    $results = $query->fetchAll(PDO::FETCH_OBJ);
} else {
    $results = [];
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Results Page</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen">
    <link rel="stylesheet" href="css/prism/prism.css" media="screen">
    <link rel="stylesheet" href="css/main.css" media="screen">
    <script src="js/modernizr/modernizr.min.js"></script>
</head>
<body>
    <div class="main-wrapper">
        <div class="content-wrapper">
            <div class="content-container">
                <div class="main-page">
                    <div class="container-fluid">
                        <div class="row page-title-div">
                            <div class="col-md-12">
                                <h2 class="title" align="center">Student's Result</h2>
                            </div>
                        </div>
                    </div>
                    <section class="section">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <div class="panel">
                                        <div class="panel-heading">
                                            <div class="panel-title">
                                                <p><b>Student Name:</b> <?php echo htmlentities($studentName); ?></p>
                                            </div>
                                        </div>
                                        <div class="panel-body p-20">
                                            <?php if (count($results) > 0) { ?>
                                                <table class="table table-hover table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Subject</th>
                                                            <th>Marks</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php
                                                        $cnt = 1;
                                                        $totalMarks = 0;
                                                        foreach ($results as $result) {
                                                        ?>
                                                            <tr>
                                                                <th scope="row"><?php echo htmlentities($cnt); ?></th>
                                                                <td><?php echo htmlentities($result->SubjectName); ?></td>
                                                                <td><?php echo htmlentities($result->marks); ?></td>
                                                            </tr>
                                                            <?php
                                                            $totalMarks += $result->marks;
                                                            $cnt++;
                                                        }
                                                        ?>
                                                        <tr>
                                                            <th scope="row" colspan="2">Total Marks</th>
                                                            <td><b><?php echo htmlentities($totalMarks); ?></b> out of <b><?php echo htmlentities(($cnt - 1) * 100); ?></b></td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" colspan="2">Average Score</th>
                                                            <td><b><?php echo htmlentities($totalMarks * 100 / (($cnt - 1) * 100)); ?> %</b></td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" colspan="2">Download Transcript</th>
                                                            <td><b><a href="download-result.php">Download</a></b></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            <?php } else { ?>
                                                <div class="alert alert-warning left-icon-alert" role="alert">
                                                    <strong>Dear Parent,</strong> Your child's results are not yet available.
                                                </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-6">
                                    <a href="index.php">Back to Home</a>
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
    <script src="js/prism/prism.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
