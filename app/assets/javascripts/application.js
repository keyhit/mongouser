// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require datatables
//= require_tree .

//$(document).ready(function() {
//var actions = "<td><a href='#'>Show</a><td>"
//
//    var table = $("#users_list").dataTable( {
//        pagingType: "full_numbers",
//        processing: true,
//        ajax: {
//            url:"/users.json",
//            dataSrc:""
//            },
//        columns: [
//            { data: 'first_name' },
//            { data: 'last_name' },
//            { data: 'birthday' },
//            { data: 'address' },
//            {"defaultContent": actions }
//        ]
//    } );
//} );



$(document).ready(function() {
     
        $("#users_list").dataTable( {
            // "processing": true,
            "serverSide": true,
            retrieve: true,
            // "filter": false,
            // "orderMulti": false,
            // "stateSave": true,
            "ajax": {
                "url": "/users.json",
                "dataSrc": "data",
                "datatype": "json"
            }
        } );
    } );
    