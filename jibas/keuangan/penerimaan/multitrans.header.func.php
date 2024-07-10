<?
/**[N]**
 * JIBAS Education Community
 * Jaringan Informasi Bersama Antar Sekolah
 * 
 * @version: 31.0 (Jun 21, 2024)
 * @notes: 
 * 
 * Copyright (C) 2024 JIBAS (http://www.jibas.net)
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 **[N]**/ ?>
<?
function ShowSelectDept()
{
    global $departemen;
    
    $dep = getDepartemen(getAccess());
    
    echo "<select name='departemen' id='departemen' style='width:100px' onchange='change_dep();'>";
    foreach($dep as $value)
    {
        if ($departemen == "")
            $departemen = $value; 
        echo "<option value='$value' " . StringIsSelected($value, $departemen) . ">$value</option>";
    }
    echo "</select>";
}

function ShowAccYear()
{
    global $departemen;
    
    $sql = "SELECT replid AS id, tahunbuku
              FROM tahunbuku
             WHERE aktif = 1
               AND departemen='$departemen'";
    $result = QueryDb($sql);
    if (mysqli_num_rows($result) > 0)
    {
        $row = mysqli_fetch_array($result);	
        echo "<input type='text' name='tahunbuku' id='tahunbuku' size='30' readonly style='background-color:#CCCC99' value='" . $row['tahunbuku'] . "'/>";
        echo "<input type='hidden' name='idtahunbuku' id='idtahunbuku' value='" . $row['id'] . "'/>";
    }
    else
    {
        echo "<input type='text' name='tahunbuku' id='tahunbuku' size='30' readonly style='background-color:#CCCC99' value=''/>";
        echo "<input type='hidden' name='idtahunbuku' id='idtahunbuku' value='0'/>";
    }
}
?>