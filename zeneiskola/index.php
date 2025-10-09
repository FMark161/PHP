<?php
include('connect.php');
include('menu.php');

if (isset($_GET['p'])) {
    $p = $_GET['p']; 
}
 else $p="";

$sql = "SELECT * FROM menu WHERE link LIKE '" . $conn->real_escape_string($p) . "'";

$result = $conn->query($sql);

    if ($result && $result->num_rows > 0): ?>
            <?php while ($row = $result->fetch_assoc()): ?>
                
                  <br>
                    <br>
                        <?php echo htmlspecialchars($row['tartalom']); ?>         
            <?php endwhile; ?>
        <?php else: ?>
           
        <?php endif; ?>

 