function goToSearchCommunity(){
    let search_value = document.getElementById("search_value").value;
    let search_item = document.getElementById("search_item").value;
    if(search_value == "" || search_value == null || search_item == "all"){
        location.href="CommunityListController";
    }else{
        location.href="CommunitySearchController?item="+search_item+"&value="+search_value;
    }
}
function goToCommunityList(){
    let getOutOfUploadPage = confirm('작성중인 글이 있습니다. 목록으로 돌아갈까요?');
    if(getOutOfUploadPage){
        location.href="CommunityListController";
    }else{
        document.preventDefault();
    }
}