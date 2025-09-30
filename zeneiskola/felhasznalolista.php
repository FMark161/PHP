<?php
include('connect.php');

if (isset($_GET['torol'])) {
    $id = (int) $_GET['torol']; // egész számmá konvertálás
    $conn->query("DELETE FROM hangszerek WHERE id = $id");
}

$sql = "SELECT * FROM hangszerek ORDER BY id";

$result = $conn->query($sql);

function h($v) { return htmlspecialchars((string)$v, ENT_QUOTES, 'UTF-8'); }
?>
 <h1>Hangszerek listája</h1>
<style>
    table { border-collapse: collapse; width: 100%; }
    th, td { border: 1px solid #ccc; padding: 6px; }
    th { background: #eee; }
    a.torol { color: red; text-decoration: none; }
  </style>
    <table border=1>
      <thead>
        <tr>
          <th>#</th>
          <th>Név</th>
          <th>Típus</th>
            <th>Művelet</th>
         
        </tr>
        </thead>
      <tbody>
        <?php if ($result && $result->num_rows > 0): ?>
          <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
              <td><?php echo isset($row['id']) ? h($row['id']) : ''; ?></td>
              <td><?php echo h($row['nev']); ?></td>
              <td>
                <?php if (!empty($row['tipus'])): ?>
                     <?php echo h($row['tipus']); ?>
                  </a>
                <?php endif; ?>
            
              <td><a class="torol" href="?torol=<?=$row['id']?>" onclick="return confirm('Biztosan törlöd?')">Törlés</a></td>
            </tr>
          <?php endwhile; ?>
        <?php else: ?>
          <tr>
            <td colspan="4">
              <div class="empty">Még nincs egyetlen bejegyzés sem.</div>
            </td>
          </tr>
        <?php endif; ?>
      </tbody>
    </table>