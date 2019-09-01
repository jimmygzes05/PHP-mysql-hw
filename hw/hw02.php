<?php
    $poker = range(0,51);
    for ($i = 51; $i > 0; $i--){
        $rand = rand(0,51);         //0~51的隨機數字
        $temp = $poker[$i];         //從最後面選取一張牌
        $poker[$i] = $poker[$rand]; //跟隨機選到的位置交換
        $poker[$rand] = $temp;
    }

    $players = [[],[],[],[]];
    foreach($poker as $i => $card){
        $players[$i % 4][(int)($i/4)] = $card;
    }
    
?>
<table border = "1" width = "80%">
   <?php
    $suits = ["&spades;",
        "<font color = 'red'>&hearts;</font>",
        "<font color = 'red'>&diams;</font>",
        "&clubs;"];
    $values = ['A',2,3,4,5,6,7,8,9,10,'J','Q','K'];
    foreach ($players as $player){
        sort($player);
        echo "<tr style = 'text-align:center'>";
        
            foreach($player as $card){
                echo "<td>";
                echo $suits[(int)($card/13)];
                echo $values[$card % 13];
                echo "</td>";
            }
        
        echo "</tr>";
    }
    ?>
</table>