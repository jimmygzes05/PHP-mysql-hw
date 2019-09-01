<table border = "1" width = "100%">
    <?php
        for ($i = 0; $i < 10; $i++){  //印出10個tr
            echo "<tr>";
            for ($j = 1; $j <= 10; $j++){   //印出10個td
                $num = $i * 10 + $j;        //印出1~100
                $isPrimeNum = true;         //判斷質數的boolean
                for ($k = 2; $k <$num; $k++){   
                    if ($num % $k == 0 ){       //從2開始 除到自己的前一個數字
                        $isPrimeNum = false;    //如果能被任一數整除 則判斷為不是質數
                        break;                  //並跳脫迴圈
                    } else {
                        $isPrimeNum = true;     //反之則是質數
                    }
                }
                //根據判斷質數的boolean 上不同的背景色
                if (!$isPrimeNum or $num == 1){
                    echo '<td bgcolor = "pink" style = "text-align:center">';
                } else {
                    echo '<td bgcolor = "yellow" style = "text-align:center">';
                }
                
                echo "{$num}";
                echo "</td>";
            }
            echo "</tr>";
        }
    ?>
</table>