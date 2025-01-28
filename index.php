<?php
// Lidhja me Databazen
$conn = new mysqli("localhost", "root", "", "balajab");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Shto Kategori te re
if (isset($_POST['shto_kategorine'])) {
    $category_name = $conn->real_escape_string($_POST['emri_kategorise']);
    $conn->query("INSERT INTO kategorite (kategorite) VALUES ('$category_name')");
}
//Shto nje produkt te ri 
if (isset($_POST['shto_produkt'])) {
    $product_name = $conn->real_escape_string($_POST['emertimi']);
    $quantity = (int)$_POST['sasia'];
    $dimensions = $conn->real_escape_string($_POST['dimensionet']);
    $price = (float)$_POST['cmimi'];
    $category_id = (int)$_POST['kategoria'];
    $serial_number = $conn->real_escape_string($_POST['shifra']);
    
    // Kontrollo nese numri serik egziston
    $check_serial = $conn->query("SELECT * FROM produktet WHERE shifra = '$serial_number'");
    if ($check_serial->num_rows > 0) {
        echo "Error: Serial number already exists.";
    } else {
    
        // Vendosja e produktit te ri
        $conn->query("INSERT INTO produktet (shifra, emertimi, dimensionet, cmimi, sasia, kategoria) 
                      VALUES ('$serial_number', '$product_name', '$dimensions', $price, $quantity, $category_id)");
    }
}

// Perditeso sasine e produktit
if (isset($_POST['update_quantity'])) {
    $serial_number = $conn->real_escape_string($_POST['shifra']);
    $quantity = (int)$_POST['sasia'];
    $conn->query("UPDATE produktet SET sasia = $quantity WHERE shifra = '$serial_number'");
}

// Ndryshimi i te dhenave te produktit
if (isset($_POST['ndrysho_produktin'])) {
    $serial_number = $conn->real_escape_string($_POST['serial_number']);
    $product_name = $conn->real_escape_string($_POST['emertimi']);
    $quantity = (int)$_POST['sasia'];
    $dimensions = $conn->real_escape_string($_POST['dimensionet']);
    $price = (float)$_POST['cmimi'];
    $conn->query("UPDATE produktet SET emertimi = '$product_name', sasia = $quantity, dimensionet = '$dimensions', cmimi = $price WHERE shifra = '$serial_number'");
}

// Merr te gjitha kategorite
$categories = $conn->query("SELECT * FROM kategorite");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Balaj AB</title>
    <link rel="stylesheet" href="style.css">
   
</head>
<body>
    <h1>Menaxhimi i Stokut - BALAJ AB</h1>
    <div class="container">
    <div class="kategoria">
    <h2>Shto Kategori të re</h2>
    <form method="post">
        <input type="text" name="emri_kategorise" placeholder="Emri i kategorisë" required>
        <button type="submit" name="shto_kategorine">Shto Kategorinë</button>
    </form></div>
    <div class="produkti">
    <h2>Shto produkt të ri</h2>
    <form method="post">
        <input type="text" name="shifra" placeholder="Shifra" required>
        <input type="text" name="emertimi" placeholder="Emertimi" required>
        <input type="number" name="sasia" placeholder="Sasia" required>
        <input type="text" name="dimensionet" placeholder="Dimensionet" required>
        <input type="number" step="0.01" name="cmimi" placeholder="Çmimi" required>
        <select name="kategoria" required>
            <option value="">Zgjedh Kategorinë</option>
            <?php while ($category = $categories->fetch_assoc()) { ?>
                <option value="<?= $category['id'] ?>"><?= $category['kategorite'] ?></option>
            <?php } ?>
        </select>
        <button type="submit" name="shto_produkt">Shto Produktin</button>
    </form>
</div>
</div>
    <?php
    // Merr kategorite per ti shfaqur ne tabela
    $categories = $conn->query("SELECT * FROM kategorite");

    while ($category = $categories->fetch_assoc()) {
        $category_id = $category['id'];
        $category_name = $category['kategorite'];

        echo "<h3> Kategoria: $category_name</h3>";

        $products = $conn->query("SELECT * FROM produktet WHERE kategoria = $category_id");

        if ($products->num_rows > 0) {
            echo "<table>";
            echo "<tr>
                    <th>Shifra</th>
                    <th>Emertimi</th>
                    <th>Sasia</th>
                    <th>Dimensionet</th>
                    <th>Çmimi</th>
                    <th>Ndryshime</th>
                  </tr>";

            while ($product = $products->fetch_assoc()) {
                echo "<tr>
                        <td>{$product['shifra']}</td>
                        <td>{$product['emertimi']}</td>
                        <td>{$product['sasia']}</td>
                          
                        <td>{$product['dimensionet']}</td>
                        <td>{$product['cmimi']} €</td>
                        <td>
                            <form method='post' style='display:inline;'>
                                <input type='hidden' name='serial_number' value='{$product['shifra']}'>
                                <input type='text' name='emertimi' value='{$product['emertimi']}' required>
                                <input type='number' name='sasia' value='{$product['sasia']}' required>
                                <input type='text' name='dimensionet' value='{$product['dimensionet']}' required>
                                <input type='number' step='0.01' name='cmimi' value='{$product['cmimi']}' required>
                                <button type='submit' name='ndrysho_produktin'>Ruaj</button>
                            </form>
                        </td>
                      </tr>";
            }

            echo "</table>";
        } else {
            echo "<p>Shtoni produktet në këtë kategori.</p>";
        }
    }
    ?>
</body>
</html>