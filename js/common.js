function FillEmpresaForm() {
    $('#TxtMailContact').val(CompanyData.MailContact);
    $('#TxtWeb').val(CompanyData.Web);
    $('#SpanSubscriptionStart').html(CompanyData.SubscriptionStart);
    $('#SpanSubscriptionEnd').html(CompanyData.SubscriptionEnd);
}

function FormatDate(date, separator) {
    if (separator == null) { separator = '-'; }
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var res = '';
    if (day < 10) { res += '0'; }
    res += day + separator;
    if (month < 10) { res += '0'; }
    return res += month + separator + year;
}

function GetDate(date, separator) {
    if (separator == null) { separator = '-'; }
    var day = date.split(separator)[0];
    var month = (date.split(separator)[1] * 1) -1;
    var year = date.split(separator)[2];
    return new Date(year, month, day);
}