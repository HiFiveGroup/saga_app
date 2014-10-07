$ ->
  console.log("ran!")
  $(".splash img").each (i) ->
    $(this).delay((i++) * 500).fadeTo 1000, 1
    return

  return
