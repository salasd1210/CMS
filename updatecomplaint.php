<?php
session_start();
include('include/config.php');
if(strlen($_SESSION['alogin'])==0)
{
  header('location:index.php');
}
else
{
  if(isset($_POST['update']))
  {
    $complaintnumber=$_GET['cid'];
    $status=$_POST['status'];
    $remark=$_POST['remark'];
    $query=mysqli_query($con,"insert into complaintremark(complaintNumber,status,remark) values('$complaintnumber','$status','$remark')");
    $sql=mysqli_query($con,"update tblcomplaints set status='$status' where complaintNumber='$complaintnumber'");

    echo "<script>alert('Complaint details Updated Successfully');</script>";
  }
  ?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Update Complaint Status</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body>
  <div style="margin-left:50px;">
    <form name="updateticket" id="updatecomplaint" method="post">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>

        <tr height="50">
          <td><b>Complaint Number</b></td>
          <td><?php echo htmlentities($_GET['cid']); ?></td>
        </tr>

        <tr height="50">
          <td><b>Status</b></td>
          <td>
            <select name="status" required="required">
              <option value="">Select Status</option>
              <option value="in process">In Process</option>
              <option value="closed">Closed</option>
            </select>
          </td>
        </tr>

        <tr height="50">
          <td><b>Remark</b></td>
          <td><textarea name="remark" cols="50" rows="10" required="required"></textarea></td>
        </tr>

        <tr height="50">
          <td>&nbsp;</td>
          <td><input type="submit" name="update" value="Submit"></td>
        </tr>

       <tr><td colspan="2">&nbsp;</td></tr>

      </table>
    </form>
  </div>

  </body>
</html>
<?php } ?>
