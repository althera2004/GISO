$(document).ready(function () {
    RenderTable();
});

 function RenderTable() {
    var target = document.getElementById('TableBody');
    for (var x = 0; x < Departments.length; x++) {
        var tr = document.createElement('tr');
        var td = document.createElement('td');
        var department = Departments[x];
        tr.id = department.Id;
        td.appendChild(document.createTextNode(department.Description));
        tr.appendChild(td);
        target.appendChild(tr);
    }
}