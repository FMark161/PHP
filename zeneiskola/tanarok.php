<?php
include('connect.php');

// Törlés kezelése
if (isset($_GET['torol'])) {
    $id = (int) $_GET['torol'];
    $conn->query("DELETE FROM tanarok WHERE id = $id");
    header('Location: '.$_SERVER['PHP_SELF']);
    exit;
}

// Módosítás feldolgozása
if (isset($_POST['modosit'])) {
    $id = (int) $_POST['id'];
    $nev = $conn->real_escape_string($_POST['nev']);
    $hangszerek = $conn->real_escape_string($_POST['hangszerek']);
    $telefon = $conn->real_escape_string($_POST['telefon']);
    $email = $conn->real_escape_string($_POST['email']);
    $nem = $conn->real_escape_string($_POST['nem']);
    $iskolaid = (int) $_POST['iskolaid'];

    $sql_update = "UPDATE tanarok SET
        nev = '$nev',
        hangszerek = '$hangszerek',
        telefon = '$telefon',
        email = '$email',
        nem = '$nem',
        iskolaid = $iskolaid
        WHERE id = $id";

    $conn->query($sql_update);

    header('Location: '.$_SERVER['PHP_SELF']);
    exit;
}

// Módosítandó tanár adatainak lekérése
$modositando = null;
if (isset($_GET['modositas'])) {
    $id = (int) $_GET['modositas'];
    $res = $conn->query("SELECT * FROM tanarok WHERE id = $id");
    if ($res && $res->num_rows > 0) {
        $modositando = $res->fetch_assoc();
    }
}

// Tanárok listája
$sql = "SELECT * FROM tanarok ORDER BY id";
$result = $conn->query($sql);

function h($v)
{
    return htmlspecialchars((string) $v, ENT_QUOTES, 'UTF-8');
}
?>

<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <title>Tanárok listája</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
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
</head>
<body>

<h1>Tanárok listája</h1>

<?php if ($modositando): ?>
    <h2>Tanár módosítása (ID: <?= h($modositando['id']) ?>)</h2>
    <form method="post">
        <input type="hidden" name="id" value="<?= h($modositando['id']) ?>">
        <label>Név: <input type="text" name="nev" value="<?= h($modositando['nev']) ?>" required></label><br><br>
        <label>Hangszerek: <input type="text" name="hangszerek" value="<?= h($modositando['hangszerek']) ?>"></label><br><br>
        <label>Telefonszám: <input type="text" name="telefon" value="<?= h($modositando['telefon']) ?>"></label><br><br>
        <label>Email: <input type="email" name="email" value="<?= h($modositando['email']) ?>"></label><br><br>
        <label>Nem:
            <select name="nem">
                <option value="férfi" <?= $modositando['nem'] === 'férfi' ? 'selected' : '' ?>>férfi</option>
                <option value="nő" <?= $modositando['nem'] === 'nő' ? 'selected' : '' ?>>nő</option>
                <option value="egyéb" <?= $modositando['nem'] === 'egyéb' ? 'selected' : '' ?>>egyéb</option>
            </select>
        </label><br><br>
        <label>Iskola ID: <input type="number" name="iskolaid" value="<?= h($modositando['iskolaid']) ?>"></label><br><br>
        <button type="submit" name="modosit">Mentés</button>
        <a href="<?= $_SERVER['PHP_SELF'] ?>">Mégse</a>
    </form>
    <hr>
<?php endif; ?>

<table>
    <thead>
        <tr>
            <th>#</th>
            <th>Név</th>
            <th>Hangszerek</th>
            <th>Telefonszám</th>
            <th>Email</th>
            <th>Nem</th>
            <th>Iskolaid</th>
            <th>Művelet</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($result && $result->num_rows > 0): ?>
            <?php while ($row = $result->fetch_assoc()): ?>
                <tr>
                    <td><?= h($row['id']) ?></td>
                    <td><?= h($row['nev']) ?></td>
                    <td><?= h($row['hangszerek']) ?></td>
                    <td><?= h($row['telefon']) ?></td>
                    <td><?= h($row['email']) ?></td>
                    <td><?= h($row['nem']) ?></td>
                    <td><?= h($row['iskolaid']) ?></td>
                    <td>
                        <a href="?modositas=<?= $row['id'] ?>">Módosítás</a> |
                        <a class="torol" href="?torol=<?= $row['id'] ?>" onclick="return confirm('Biztosan törlöd?')">Törlés</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="8">
                    <div class="empty">Még nincs egyetlen bejegyzés sem.</div>
                </td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

</body>
</html>
