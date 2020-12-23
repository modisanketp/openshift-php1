<?php

$conn = mysqli_connect($_ENV["DATABASE_SERVICE_NAME"],$_ENV["DATABASE_USER"], $_ENV["DATABASE_PASSWORD"],$_ENV["DATABASE_NAME"]);
if (!$conn) {
http_response_code (500);
error_log ("Error: unable to connect to database\n"); die();
}

$sql = "SELECT id, firstname, lastname FROM MyGuests";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
  }
} else {
  echo "0 results";
}
$conn->close();

>
