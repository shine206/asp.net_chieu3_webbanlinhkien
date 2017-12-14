function clickButton(e, btnSearch) {
    var evt = e ? e : window.event;
    var bt = document.getElementById(btnSearch);

    if (bt) {
        if (evt.keyCode == 13) {
            bt.click();
            return false;
        }
    }
}