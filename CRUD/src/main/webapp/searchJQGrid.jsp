<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Demo which uses Bootstrap 4</title>
    <link rel="stylesheet" crossorigin="anonymous"
          href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha256-eSi1q2PG6J7g7ib17yAaWMcrr5GrtohYChqibrV7PBE=">
    <link rel="stylesheet" crossorigin="anonymous"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          integrity="sha256-eZrrJcwDc/3uDhsdt61sL2oOBY362qM3lon1gyExkL0=">
    <link rel="stylesheet" crossorigin="anonymous"
          href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.5/css/ui.jqgrid.min.css"
          integrity="sha256-3oIi71IMpsoA+8ctSTIM+6ScXYjyZEV06q6bbK6CjsM=">
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css"/>
    <script crossorigin="anonymous" src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="></script>
    <!-- the next line need be uncommented if you need to use bootstrap.min.js -->
    <!--<script crossorigin="anonymous"
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha256-98vAGjEDGN79TjHkYWVD4s87rvWkdWLHPs5MC3FvFX4="></script>
    <script crossorigin="anonymous"
            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha256-VsEqElsCHSGmnmHXGQzvoWjWwoznFSZc6hs7ARLRacQ="></script>-->
    <script>
        $.jgrid = $.jgrid || {};
        $.jgrid.no_legacy_api = true;
    </script>
    <script crossorigin="anonymous"
            src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.5/jquery.jqgrid.min.js"
            integrity="sha256-ELi2cs17gL2MqNzkRkogxZsVLmL+oWfeVOwZQLcp8ek="></script>
    <script>
    //<![CDATA[
    $(function () {
        "use strict";
        $("#grid1b").jqGrid({
            colModel: [
                { name: "roll_num", label: "Roll Number", width: 100, align: "center" },
                { name: "name", label: "Name", width: 100, align: "center" },
                { name: "dob", label: "Date of Birth", width: 100, align: "center", sorttype: "date",
                    formatter: "date", formatoptions: { newformat: "d-M-Y" } },
                { name: "physics_marks", label: "Physics Marks", width: 100, template: "number", align: "center"},
                { name: "chemistry_marks", label: "Chemistry Marks", width: 100, template: "number", align: "center"},
                { name: "math_marks", label: "Math Marks", width: 100, template: "number", align: "center"},
                { name: "total", label: "Total Marks", width: 100, template: "number", align: "center"},
                { name: "grade", label: "Grade", width: 100, align: "center",
                	formatter: "select",
                    formatoptions: { value: "A:A;B:B;C:C;D:D;F:F", defaultValue: "A	" },
                    stype: "select",
                    searchoptions: { value: ":Any;A:A;B:B;C:C;D:D;F:F" } },
                { name: "profile_pic", formatter: profile_formatter, align: "center", search:false},
            ],
            data: [
                { id: "1",  roll_num: "MT2018098", name: "Sagar",   dob: "1995-12-25", physics_marks:"50", chemistry_marks:"50", math_marks:"50", total:"150", grade:"A", profile_pic:"img/100.png"},
                { id: "2",  roll_num: "MT2018099", name: "Hima",   dob: "1995-12-25", physics_marks:"50", chemistry_marks:"50", math_marks:"50", total:"150", grade:"A", profile_pic:"img/100.png"},
                { id: "3",  roll_num: "MT2018100", name: "Ankit",   dob: "1995-12-25", physics_marks:"50", chemistry_marks:"50", math_marks:"50", total:"150", grade:"A", profile_pic:"img/100.png"},
                { id: "4",  roll_num: "MT2018101", name: "Samridhi",   dob: "1995-12-25", physics_marks:"50", chemistry_marks:"50", math_marks:"50", total:"150", grade:"A", profile_pic:"img/100.png"},
                { id: "5",  roll_num: "MT2018102", name: "Shreyansh",   dob: "1995-12-25", physics_marks:"50", chemistry_marks:"50", math_marks:"50", total:"150", grade:"A", profile_pic:"img/100.png"},
                { id: "6",  roll_num: "MT2018103", name: "Mayur",   dob: "1995-12-25", physics_marks:"50", chemistry_marks:"50", math_marks:"50", total:"150", grade:"A", profile_pic:"img/100.png"},
                { id: "6",  roll_num: "MT2018103", name: "Mayur",   dob: "1995-12-25", physics_marks:"50", chemistry_marks:"50", math_marks:"50", total:"150", grade:"A", profile_pic:"img/100.png"}
            ],
            iconSet: "fontAwesome",
            idPrefix: "g5_",
            rownumbers: true,
            sortname: "invdate",
            sortorder: "desc",
            threeStateSort: true,
            sortIconsBeforeText: true,
            headertitles: true,
            toppager: true,
            pager: true,
            rowNum: 5,
            viewrecords: true,
            searching: {
                defaultSearch: "cn"
            },
        }).jqGrid("filterToolbar");
    });
    //]]>
    function profile_formatter(cellvalue, options, rowObject) 
    {
      var html = "<img width=\"100\" height=\"50\" src='"+cellvalue+"'/>";
      return html;
    }
    </script>
</head>
<body>
<table id="grid1b"></table>
</body>
</html>