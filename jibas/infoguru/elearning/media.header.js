function ch_changeDept()
{
    if ($("#departemen").has('option').length === 0)
        return;

    $("#divPelajaran").html("memuat ...");
    $("#divChannel").html("memuat ...");

    var dept = $("#departemen").val();
    $.ajax({
        url: "media.header.ajax.php",
        data: "op=getpelajaran&dept=" + dept,
        success: function (html)
        {
            $("#divPelajaran").html(html);

            setTimeout(function ()
            {
                var idpel = $("#pelajaran").val();

                $.ajax({
                    url: "media.header.ajax.php",
                    data: "op=getchannel&idpel=" + idpel,
                    success: function (html)
                    {
                        $("#divChannel").html(html);
                    },
                    error: function (xhr, response, error)
                    {
                        alert(xhr.responseText);
                    }
                });

            }, 250);
        },
        error: function (xhr, response, error)
        {
            alert(xhr.responseText);
        }
    });

    parent.content.location.href = "media.blank.php";
}

function ch_changePel()
{
    $("#divChannel").html("memuat ...");

    var idpel = $("#pelajaran").val();

    $.ajax({
        url: "media.header.ajax.php",
        data: "op=getchannel&idpel=" + idpel,
        success: function (html)
        {
            $("#divChannel").html(html);
        },
        error: function (xhr, response, error)
        {
            alert(xhr.responseText);
        }
    });

    parent.content.location.href = "media.blank.php";
}

function ch_tampil()
{
    if ($("#departemen").has('option').length === 0)
        return;

    if ($("#pelajaran").has('option').length === 0)
        return;

    if ($("#channel").has('option').length === 0)
        return;

    var idChannel = $("#channel").val();

    parent.content.location.href = "media.content.php?idChannel=" + idChannel;
}