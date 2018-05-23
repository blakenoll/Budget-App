document.addEventListener("turbolinks:load", function() {

    $('.form-signin input[type=number]').keyup(function() {

        inputTotal = $('#total').val();
        envelopetotal = 0;

        $("#inputs input[type=number]").each(function() {
            envelopetotal = envelopetotal + Number(this.value)
        });

        if (envelopetotal > inputTotal) {
            $('#submit').prop('disabled', true)
        } else {
            $('#submit').prop('disabled', false)
        }

        unallocated = inputTotal - envelopetotal
        if (unallocated < 0) {
            $('#unallocated').addClass('red')
        } else {
            $('#unallocated').removeClass('red')
        }
        $('#unallocated').text('$' + unallocated)
    });

    $(document).ready(function() {
      $(".clickable-row").click(function() {
        window.location = $(this).data("href")
      })
    })

})

function checkInputs() {

}
