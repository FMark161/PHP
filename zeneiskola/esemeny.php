<?php
include('connect.php');

if (isset($_GET['torol'])) {
    $id = (int) $_GET['torol']; // egész számmá konvertálás
    $conn->query("DELETE FROM tanarok WHERE id = $id");
}

$sql = "SELECT * FROM esemenyek ORDER BY id";

$result = $conn->query($sql);

function h($v)
{
    return htmlspecialchars((string) $v, ENT_QUOTES, 'UTF-8');
}
?>
<h1>Tanárok listája</h1>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }

    th,
    td {
        border: 1px solid #ccc;
        padding: 6px;
    }

    th {
        background: #eee;
    }

    a.torol {
        color: red;
        text-decoration: none;
    }
</style>
<table border=1>
    <thead>
        <tr>
            <th>#</th>
            <th>Esemény neve</th>
            <th>Esemény leírása</th>
            <th>Iskola</th>
            <th>Kapcsolattartó</th>
            <th>Helyszín</th>
            <th>Időpont</th>
            <th>Művelet</th>

        </tr>
    </thead>
    <tbody>
        <?php if ($result && $result->num_rows > 0): ?>
            <?php while ($row = $result->fetch_assoc()): ?>
                <tr>
                    <td><?php echo isset($row['id']) ? h($row['id']) : ''; ?></td>
                    <td><?php echo h($row['Esemeny_neve']); ?></td>
                    <td>
                        <?php if (!empty($row['Esemeny_leirasa'])): ?>
                            <?php echo h($row['Esemeny_leirasa']); ?>
                        <td><?php echo h($row['Iskola']); ?></td>
                        <td><?php echo h($row['Kapcsolattarto']); ?></td>
                        <td><?php echo h($row['Helyszin']); ?></td>
                        <td><?php echo h($row['Idopont']); ?></td>
                        </a>
                    <?php endif; ?>

                    <td><a class="torol" href="?torol=<?= $row['id'] ?>" onclick="return confirm('Biztosan törlöd?')">Törlés</a>
                    </td>
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