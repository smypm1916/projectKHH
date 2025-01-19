function goToSearchCommunity(){
    let search_item = document.getElementById("search-item").value;
    if(search_item == "" || search_item == null){
        location.href="CommunityListController";
    }else{
        location.href="CommunitySearchController?item="+search_item;
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