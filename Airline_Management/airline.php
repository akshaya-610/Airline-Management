<!--external css-->
<!-- <link rel="stylesheet" href="style.css"> -->

<!DOCTYPE html>
<html lang="">
    <head>
    <link rel="stylesheet" href="style.css">
        
    <style>
        body {
 background-image: url("img9.jpg");
 background-color: rgb(226, 230, 173);

  /* background-image: url('w3css.gif'); */
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center;

}
table, th, td {
    
    padding: 25px;
    text-align: left;
    color: #000000;
    border-bottom: 1px solid #000000;
    border-color:#000000;
    font-size: large;
  }

   h1 {
  font-size: 30px;
  font-weight: 100;
  background-image: linear-gradient(45deg, #553c9a, #ee4b2b);
  color: transparent;
  background-clip: text;
  -webkit-background-clip: text;
  text-align: center;
  background-color:aqua;
  background-color: hsl(0, 4%, 5%);
}
img{
    float: right;
    padding-right:15cm ;
    padding-top: 1cm;
    
}


input[type=text] {
    border: none;
    border-bottom: 2px solid black;
  }

  label{
    color: black;
    font:italic;
  }
  button{
    border: black;
    background-color: black;
    border-radius: 40%;
    color:#553c9a;
  }

    
    </style>
</head>

<body>

 


            <div class="col-md-8">
            <h1 class="admin_page">AIRLINE MANAGEMENT SYSTEM</h1>
            
                  <?php
                    require_once('al_connect.php'); ?>
                    <h2 style="color:black">Select the Airline to display the Flight details</h2>
                    <form method="post">
                    <div style = "text-align: centre">   
                    <label for="usr_ip" style="color:black">Airline:  </label>
                    <select name="usr_ip" id="usr_ip">
                        <option>--Select airline--</option>
                        <option value = "AI">'AI' - Air India Limited</option>
                        <option value = "AA">'AA' - American Airlines</option>
                        <option value = "LH">'LH' - Lufthansa</option>
                        <option value = "BA">'BA' - British Airways</option>
                        <option value = "QR">'QR' - Qatar Airways</option>
                        <option value = "9W">'9W' - Jet Airways</option>
                        <option value = "EK">'EK' - Emirates</option>
                        <option value = "EY">'EY' - Ethiad Airways</option>

                    </Select>
                    <br><br>
                    <input type ="submit" name="submit" value="Submit">
                    </div>

                    


                    <!-- <button type="submit" name="submit">Submit</button> -->
                    <?php

                 
                    
                    if (isset($_POST['submit'])) {?>
                        <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>FL_CODE</th>
                        <th>SRC</th>
                        <th>DEST</th>
                        <th>ARR</th>
                        <th>DEPT</th>
                        <th>STATUS</th>
                        <th>DURATION</th>
                        <th>FL_TYPE</th>
                        <th>LAYOVER_TIME</th>
                        <th>NO_OF_STOPS</th>
                        <th>AIRLINEID</th>
                        
                         
                      
                    </tr>
                </thead>
                <tbody>
                <?php
                        $ip = $_POST['usr_ip'];
                $query="SELECT	FLIGHT_CODE, SOURCE, DESTINATION,ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS,AIRLINEID
                FROM	flight
                WHERE AIRLINEID IN (SELECT AIRLINEID
                FROM AIRLINE
                WHERE AIRLINEID='$ip')";

                //    GROUP BY	bill_date
                //    HAVING		SUM(total_amt)>='$ip'";
                    
                    if($result = mysqli_query($conn, $query)){
                        if($result->num_rows > 0){
                            while($row = $result->fetch_object()){
                                
                                // ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID   
                    ?> 
                        <tr>
                            
                                <td><?php echo $row->FLIGHT_CODE?></td> 
                                <td><?php echo $row->SOURCE?></td>
                                <td><?php echo $row->DESTINATION?></td>
                                <td><?php echo $row->ARRIVAL?></td>
                                <td><?php echo $row->DEPARTURE?></td>
                                <td><?php echo $row->STATUS?></td>
                                <td><?php echo $row->DURATION?></td>
                                <td><?php echo $row->FLIGHTTYPE?></td>
                                <td><?php echo $row->LAYOVER_TIME?></td>
                                <td><?php echo $row->NO_OF_STOPS?></td>
                                <td><?php echo $row->AIRLINEID?></td>
                                
                        </tr>        
                            
                        

                 <?php 
                            }
                            

                    
                
                }
            }
    
                   
                        }
                    
                    
                  ?>
                    </form>
                    
                </tbody>
            </table>
            <div class="col-md-2"></div>

    </body>
</html>
            