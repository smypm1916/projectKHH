function goToSearchCommunity(){
    let search_item = document.getElementById("search-item").value;
    if(search_item == "" || search_item == null){
        location.href="CommunityListController";
    }else{
        location.href="CommunitySearchController?item="+search_item;
    }
}