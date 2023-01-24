---
title: "Important Areas for plant biodiversity and conservation"
author: "Gilles Dauby"
date: "29/04/2022"
output: pdf_document
---






```
#> Reading layer `ST_imp_areas' from data source 
#>   `D:\MonDossierR\saothreat\ST_imp_areas.shp' 
#>   using driver `ESRI Shapefile'
#> Simple feature collection with 17 features and 1 field
#> Geometry type: POLYGON
#> Dimension:     XY
#> Bounding box:  xmin: 6.469016 ymin: 0.066618 xmax: 6.651449 ymax: 0.408157
#> Geodetic CRS:  WGS 84
#> Reading layer `P_imp_areas' from data source 
#>   `D:\MonDossierR\saothreat\P_imp_areas.dbf' 
#>   using driver `ESRI Shapefile'
#> Simple feature collection with 4 features and 1 field
#> Geometry type: POLYGON
#> Dimension:     XY
#> Bounding box:  xmin: 7.327387 ymin: 1.525935 xmax: 7.427939 ymax: 1.670031
#> Geodetic CRS:  WGS 84
```









```{=html}
<div id="kaheosgkpx" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#kaheosgkpx .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#kaheosgkpx .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#kaheosgkpx .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#kaheosgkpx .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#kaheosgkpx .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#kaheosgkpx .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#kaheosgkpx .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#kaheosgkpx .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#kaheosgkpx .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#kaheosgkpx .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#kaheosgkpx .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#kaheosgkpx .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#kaheosgkpx .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#kaheosgkpx .gt_from_md > :first-child {
  margin-top: 0;
}

#kaheosgkpx .gt_from_md > :last-child {
  margin-bottom: 0;
}

#kaheosgkpx .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#kaheosgkpx .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#kaheosgkpx .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#kaheosgkpx .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#kaheosgkpx .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#kaheosgkpx .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#kaheosgkpx .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#kaheosgkpx .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#kaheosgkpx .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#kaheosgkpx .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#kaheosgkpx .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#kaheosgkpx .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#kaheosgkpx .gt_left {
  text-align: left;
}

#kaheosgkpx .gt_center {
  text-align: center;
}

#kaheosgkpx .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#kaheosgkpx .gt_font_normal {
  font-weight: normal;
}

#kaheosgkpx .gt_font_bold {
  font-weight: bold;
}

#kaheosgkpx .gt_font_italic {
  font-style: italic;
}

#kaheosgkpx .gt_super {
  font-size: 65%;
}

#kaheosgkpx .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">ID_shapefile</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">value</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">n</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">nbe_sp</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">nbe_sp_end</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">nbe_sp_threat</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_right">14</td>
<td class="gt_row gt_left">Northern Savannah in front of Agua Azul</td>
<td class="gt_row gt_left">**</td>
<td class="gt_row gt_right">134</td>
<td class="gt_row gt_right">73</td>
<td class="gt_row gt_right">3</td>
<td class="gt_row gt_right">0</td></tr>
    <tr><td class="gt_row gt_right">15</td>
<td class="gt_row gt_left">Ribeira Fria</td>
<td class="gt_row gt_left">***</td>
<td class="gt_row gt_right">64</td>
<td class="gt_row gt_right">35</td>
<td class="gt_row gt_right">7</td>
<td class="gt_row gt_right">1</td></tr>
    <tr><td class="gt_row gt_right">1</td>
<td class="gt_row gt_left">Ponta Figo</td>
<td class="gt_row gt_left">**</td>
<td class="gt_row gt_right">12</td>
<td class="gt_row gt_right">9</td>
<td class="gt_row gt_right">4</td>
<td class="gt_row gt_right">2</td></tr>
    <tr><td class="gt_row gt_right">2</td>
<td class="gt_row gt_left">Santa Catarina</td>
<td class="gt_row gt_left">*</td>
<td class="gt_row gt_right">101</td>
<td class="gt_row gt_right">53</td>
<td class="gt_row gt_right">19</td>
<td class="gt_row gt_right">6</td></tr>
    <tr><td class="gt_row gt_right">3</td>
<td class="gt_row gt_left">Western buffer zone</td>
<td class="gt_row gt_left">***</td>
<td class="gt_row gt_right">275</td>
<td class="gt_row gt_right">95</td>
<td class="gt_row gt_right">29</td>
<td class="gt_row gt_right">6</td></tr>
    <tr><td class="gt_row gt_right">4</td>
<td class="gt_row gt_left">South western forest</td>
<td class="gt_row gt_left">**</td>
<td class="gt_row gt_right">166</td>
<td class="gt_row gt_right">77</td>
<td class="gt_row gt_right">14</td>
<td class="gt_row gt_right">3</td></tr>
    <tr><td class="gt_row gt_right">5</td>
<td class="gt_row gt_left">Monte Carmo</td>
<td class="gt_row gt_left">***</td>
<td class="gt_row gt_right">182</td>
<td class="gt_row gt_right">80</td>
<td class="gt_row gt_right">29</td>
<td class="gt_row gt_right">11</td></tr>
    <tr><td class="gt_row gt_right">6</td>
<td class="gt_row gt_left">Pico Makuru</td>
<td class="gt_row gt_left">***</td>
<td class="gt_row gt_right">74</td>
<td class="gt_row gt_right">41</td>
<td class="gt_row gt_right">9</td>
<td class="gt_row gt_right">4</td></tr>
    <tr><td class="gt_row gt_right">7</td>
<td class="gt_row gt_left">Rio Io grande</td>
<td class="gt_row gt_left">*</td>
<td class="gt_row gt_right">11</td>
<td class="gt_row gt_right">11</td>
<td class="gt_row gt_right">4</td>
<td class="gt_row gt_right">1</td></tr>
    <tr><td class="gt_row gt_right">8</td>
<td class="gt_row gt_left">Pico Maria Fernandez</td>
<td class="gt_row gt_left">***</td>
<td class="gt_row gt_right">236</td>
<td class="gt_row gt_right">111</td>
<td class="gt_row gt_right">28</td>
<td class="gt_row gt_right">11</td></tr>
    <tr><td class="gt_row gt_right">9</td>
<td class="gt_row gt_left">Bombaim – Formoso – Aguas Belas</td>
<td class="gt_row gt_left">***</td>
<td class="gt_row gt_right">485</td>
<td class="gt_row gt_right">193</td>
<td class="gt_row gt_right">30</td>
<td class="gt_row gt_right">11</td></tr>
    <tr><td class="gt_row gt_right">10</td>
<td class="gt_row gt_left">Ridge Macambara</td>
<td class="gt_row gt_left">**</td>
<td class="gt_row gt_right">78</td>
<td class="gt_row gt_right">51</td>
<td class="gt_row gt_right">22</td>
<td class="gt_row gt_right">8</td></tr>
    <tr><td class="gt_row gt_right">11</td>
<td class="gt_row gt_left">Tras os Montes – Zampalma</td>
<td class="gt_row gt_left">*</td>
<td class="gt_row gt_right">513</td>
<td class="gt_row gt_right">187</td>
<td class="gt_row gt_right">53</td>
<td class="gt_row gt_right">25</td></tr>
    <tr><td class="gt_row gt_right">12</td>
<td class="gt_row gt_left">Chamiso – Morro Santana – Morro Provaz</td>
<td class="gt_row gt_left">***</td>
<td class="gt_row gt_right">228</td>
<td class="gt_row gt_right">91</td>
<td class="gt_row gt_right">25</td>
<td class="gt_row gt_right">7</td></tr>
    <tr><td class="gt_row gt_right">13</td>
<td class="gt_row gt_left">Munquiqui</td>
<td class="gt_row gt_left">*</td>
<td class="gt_row gt_right">45</td>
<td class="gt_row gt_right">27</td>
<td class="gt_row gt_right">3</td>
<td class="gt_row gt_right">1</td></tr>
    <tr><td class="gt_row gt_right">16</td>
<td class="gt_row gt_left">PN Obo</td>
<td class="gt_row gt_left">***</td>
<td class="gt_row gt_right">4608</td>
<td class="gt_row gt_right">601</td>
<td class="gt_row gt_right">106</td>
<td class="gt_row gt_right">41</td></tr>
    <tr><td class="gt_row gt_right">17</td>
<td class="gt_row gt_left">Pico grande et Pequeno area</td>
<td class="gt_row gt_left">***</td>
<td class="gt_row gt_right">516</td>
<td class="gt_row gt_right">123</td>
<td class="gt_row gt_right">42</td>
<td class="gt_row gt_right">24</td></tr>
  </tbody>
  
  
</table>
</div>
```



