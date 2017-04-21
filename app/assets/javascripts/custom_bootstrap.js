    $("list-group-item").click(function(e) {
        e.preventDefault();
        $(this).removeClass('active');
        $(this).addClass('active');
    });