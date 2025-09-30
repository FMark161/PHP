<?php

include('connect.php');




if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nev = $_POST['nev'];
    $tipus = $_POST['tipus'];
   
    

    $sql = "INSERT INTO hangszerek (nev, tipus) 
            VALUES ('$nev', '$tipus')";

    if ($conn->query($sql) === TRUE) {
        echo "<p style='color:green;'>Sikeres mentés!</p>";
    } else {
        echo "<p style='color:red;'>Hiba: " . $conn->error . "</p>";
    }
}

$conn->close();
?>
 <form action="" method="post">
      <h2>Hangszer hozzáadása</h2>

      <div class="input-field">
        <label>Név</label>
        <input type="text" name="nev" required />
        
      </div>

      <div class="input-field">
        <label>Típus</label>
        <input type="text" name="tipus" required />
        
      </div>

   
      <button type="submit" id="button" >Elküldés</button>

</form>