<?php

$templateInsert = "INSERT INTO customers(first_name,last_name,email) VALUES ('%s','%s','%s');";
$templateUpdate = "UPDATE customers SET first_name=last_name, last_name=first_name WHERE id=%d;";

$serverName = "localhost";
$connectionOptions = array(
    "database" => "testDB",
    "uid" => "sa",
    "pwd" => "Password!"
);

$batchSize = 100;

function exception_handler($exception) {
    echo "<h1>Failure</h1>";
    echo "Uncaught exception: " , $exception->getMessage();
}

set_exception_handler('exception_handler');

// Establishes the connection
$conn = sqlsrv_connect($serverName, $connectionOptions);
if ($conn === false) {
    die(formatErrors(sqlsrv_errors()));
}

$query = "";

for ($i=0; $i<10000000; $i++) {
    $email = generateEmailAddress(15, 15);
    $parts = explode('@', $email);
    $parts1 = explode('.', $parts[1]);
    $first = $parts[0];
    $last = $parts1[0];
    $insert = sprintf($templateInsert, $first, $last, $email);

//  $update = sprintf($templateUpdate, rand(0, $i));
//     // Executes the query
//     $stmt = sqlsrv_query($conn, $update);
//
//     // Error handling
//     if ($stmt === false) {
//         die(formatErrors(sqlsrv_errors()));
//     }

    $query .= $insert . "\n";

    if ($i > 0 && ($i % $batchSize == 0)) {
        echo $i . ' records ' . PHP_EOL;
        commit($query, $conn);
        $query = "";
        exit;
    }
}

commit($query, $conn);

function commit($query, $conn) {
    // Executes the query
    $stmt = sqlsrv_query($conn, $query);
    // Error handling
    if ($stmt === false) {
        die(formatErrors(sqlsrv_errors()));
    }
}

function generateEmailAddress($maxLenLocal=64, $maxLenDomain=255){
    $numeric        =  '0123456789';
    $alphabetic     = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    $extras         = '.-_';
    $all            = $numeric . $alphabetic . $extras;
    $alphaNumeric   = $alphabetic . $numeric;
    $alphaNumericP  = $alphabetic . $numeric . "-";
    $randomString   = '';

    // GENERATE 1ST 4 CHARACTERS OF THE LOCAL-PART
    for ($i = 0; $i < 4; $i++) {
        $randomString .= $alphabetic[rand(0, strlen($alphabetic) - 1)];
    }
    // GENERATE A NUMBER BETWEEN 20 & 60
    $rndNum         = rand(20, $maxLenLocal-4);

    for ($i = 0; $i < $rndNum; $i++) {
        $randomString .= $all[rand(0, strlen($all) - 1)];
    }

    // ADD AN @ SYMBOL...
    $randomString .= "@";

    // GENERATE DOMAIN NAME - INITIAL 3 CHARS:
    for ($i = 0; $i < 3; $i++) {
        $randomString .= $alphabetic[rand(0, strlen($alphabetic) - 1)];
    }

    // GENERATE A NUMBER BETWEEN 15 & $maxLenDomain-7
    $rndNum2        = rand(15, $maxLenDomain-7);
    for ($i = 0; $i < $rndNum2; $i++) {
        $randomString .= $all[rand(0, strlen($all) - 1)];
    }
    // ADD AN DOT . SYMBOL...
    $randomString .= ".";

    // GENERATE TLD: 4
    for ($i = 0; $i < 4; $i++) {
        $randomString .= $alphaNumeric[rand(0, strlen($alphaNumeric) - 1)];
    }

    return $randomString;

}

