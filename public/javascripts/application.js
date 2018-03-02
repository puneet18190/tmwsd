$("form").live("ajax:aborted:required", function(event, elements){
  return false;
});

$("#new-message-url").live("ajax:success", function(event, data){
  data["message_url"]["number"] = $("#message-info table tbody tr").size();
  $("#message-info table tbody").append(ich.template(data["message_url"]));
});

$("#select-link").live("click", function(){
  $("#retrieved-message").selectText();
});

$(".copy").livequery(function(){
  $(this).zclip({
    path: "/flash/zeroclipboard.swf",
    copy: function(){
      console.log(this);
      return $("#"+$(this).attr("rel")).text();
    },
    afterCopy: function(){}
  });
});
