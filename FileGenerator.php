<?php
  require 'vendor/autoload.php';

  use PhpOffice\PhpSpreadsheet\Spreadsheet;
  use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
  
  class FileGenerator
  {
    function createSpreadsheet($data) {
      print_r($data);
      $spreadsheet = new Spreadsheet();
      $sheet = $spreadsheet->getActiveSheet();

      $keys = array_keys($data[0]);
      
      // create table heading
      foreach ($keys as $key => $value) {
        $col = chr(ord('A') + $key);
        $cell = $col . '1';
        $sheet->getColumnDimension($col)->setAutosize(true);
        $sheet->setCellValue($cell, $value);
      }

      // create table record
      foreach ($data as $key => $value) {
        $colIndex = 0;
        foreach ($value as $key2 => $value2) {
          $cell = chr(ord('A') + $colIndex) . ($key + 2);
          $sheet->setCellValue($cell, ucfirst($value2));
          $colIndex++;
        }
      }
      
      $writer = new Xlsx($spreadsheet);
      $writer->save('download.xlsx');
    }
    
    function createPdf($data) {
      $keys = array_keys($data[0]);
      $mpdf = new \Mpdf\Mpdf();

      $mpdf->Bookmark('Start of the document');
      
      // heading
      $heading = "";

      foreach ($keys as $key => $value) {
        $heading .= "<th style='border:1px solid #000;'>" . $value . "</th>";
      }
      print_r($heading);

      // content
      $content = "";
      $index = 1;
      foreach ($data as $key => $value) {
        $colIndex = 0;
        $content .= "<tr>";
        foreach ($value as $key2 => $value2) {
          $content .= "<td style='border:1px solid #000;'>" . $value2 . "</td>";          
        }
        $content .= "</tr>";
        $index++;
      }
      print_r($content);
      

      $mpdf->WriteHTML(
        "<table style='width: 100%;'>".
        "<thead><tr>" . $heading . "</tr></thead>".
        "<tbody>" . $content . "</tbody>".
        "</table>"
      );

      $mpdf->Output('download.pdf','F');
    }
  }
?>