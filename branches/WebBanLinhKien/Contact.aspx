<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebBanLinhKien.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ProductContent">
    <section class="pageContact">
        <div class="container">
            <div class="clearfix">
                <div class="pageContactAddresses">
                    <div class="pageContactAddress active" data-toggle="tab" data-target=".map-1">
                        <h2 class="pageContactAddressTitle"><i class="fa fa-map-marker"></i>skymarket</h2>
                        <p><span class="label">Địa chỉ:</span> Hồ Chí Minh</p>
                        <p><span class="label">Số điện thoại:</span> <a href="tel:0987494949">0987494949</a></p>
                        <p class="last"><span class="label">Email:</span> <a href="SDViet@gmail.com">SDViet@gmail.com</a></p>
                    </div>
                    <div class="pageContactAddress" data-toggle="tab" data-target=".map-2">
                        <h2 class="pageContactAddressTitle"><i class="fa fa-map-marker"></i>skymarket chi nhánh 1</h2>
                        <p><span class="label">Địa chỉ:</span> Hồ Chí Minh</p>
                        <p><span class="label">Số điện thoại:</span> <a href="tel:0987494949">0987494949</a></p>
                        <p class="last"><span class="label">Email:</span> <a href="SDViet@gmail.com">SDViet@gmail.com</a></p>
                    </div>
                    <div class="pageContactAddress" data-toggle="tab" data-target=".map-3">
                        <h2 class="pageContactAddressTitle"><i class="fa fa-map-marker"></i>skymarket chi nhanh 2</h2>
                        <p><span class="label">Địa chỉ:</span> Hồ Chí Minh</p>
                        <p><span class="label">Số điện thoại:</span> <a href="tel:0987494949">0987494949</a></p>
                        <p class="last"><span class="label">Email:</span> <a href="SDViet@gmail.com">SDViet@gmail.com</a></p>
                    </div>
                </div>
                <div id="map" class="tab-content">
                    <div class="map-1 tab-pane fade in active">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.833252363423!2d106.68439001435083!3d10.824069692289173!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528faeace260d%3A0xb3a08964f62c3c0c!2zQ2jhu6MgZ8OyIHbhuqVw!5e0!3m2!1svi!2s!4v1493979994227" width="100%" height="100%" frameborder="0" style="border: 0" allowfullscreen></iframe>
                    </div>
                    <div class="map-2 tab-pane fade">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.1815838655953!2d106.76542611435138!3d10.873789592255473!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d87f75730689%3A0x3a62bc942b039c39!2zQ2jhu6MgVGjhu6cgxJDhu6lj!5e0!3m2!1svi!2s!4v1493980727767" width="100%" height="100%" frameborder="0" style="border: 0" allowfullscreen></iframe>
                    </div>
                    <div class="map-3 tab-pane fade">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.833252363423!2d106.68439001435083!3d10.824069692289173!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528faeace260d%3A0xb3a08964f62c3c0c!2zQ2jhu6MgZ8OyIHbhuqVw!5e0!3m2!1svi!2s!4v1493979994227" width="100%" height="100%" frameborder="0" style="border: 0" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
        <div class="pageContactContent">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-6">
                        <div class="pageContactForm">
                            <h2 class="titleDecoration"><span class="line"></span><span class="title fz18">Góp ý với chúng tôi</span></h2>
                            <form accept-charset="UTF-8" action="#" id="contact" method="post">
                                <input name="FormType" type="hidden" value="contact">
                                <input name="utf8" type="hidden" value="true">
                                <i class="ContactFormNote">Bạn vui điền đầy đủ các thông tin để chúng tôi có thể phản hồi ý kiến của bạn.</i>
                                <%--<input type="text" name="contact[Name]" required="" class="input-control" placeholder="Họ và tên...">--%>
                                <asp:TextBox ID="txtContactName" CssClass="input-control" placeholder="Họ và tên..." runat="server" />
                                <asp:RequiredFieldValidator ErrorMessage="(Bạn phải nhập tên của bạn!!)" ControlToValidate="txtContactName" runat="server" />

                                <%--<input type="email" name="contact[email]" required="" class="input-control" placeholder="Email...">--%>
                                <asp:TextBox ID="txtEmailContact" CssClass="input-control" Font-Names="contact[email]" placeholder="Email..." TextMode="Email" runat="server" />
                                <asp:RequiredFieldValidator ErrorMessage="(Bạn phải nhập email!!)" ControlToValidate="txtEmailContact" runat="server" />

                                <textarea name="contact[Body]" class="input-control" required="" placeholder="Lời nhắn..."></textarea>
                                
                                <%--<button class="button">Gửi góp ý</button>--%>
                                <asp:Button Text="Gửi góp ý" ID="btnGui" runat="server" />
                            </form>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6">
                        <div class="pageContactText">
                            <p>Hàng tiêu dùng nói chung và hàng tiêu dùng Thái Lan nói riêng ngày càng trở nên thân thiết với mọi gia đình. Trong xã hội đa dạng hàng hóa như hiện nay, sự lựa chon thông minh cho bản thân và gia đính chính là sự lựa chọn an toàn và chất lượng. Hơn nữa không phải chị em phụ nữ nào cũng có thời gian rảnh rỗi để đi mua sắm và lựa chọn kỹ càng. Chính vì thế, hình thức mua sắm shopping online đã ra đời, tiện lợi, không tốn nhiều thời gian tìm kiếm và ngày càng thu hút được sự quan tâm của người tiêu dùng bận rộn.</p>

                            <p>Shopping online từ lâu đã được các nước như Mỹ, Pháp, Úc… ưa chuộng, và hiện nay đang là trào lưu của nhiều phụ nữ Việt Nam. Sau 2 năm hình thành và phát triển, <strong>Sky Market&nbsp;</strong>đã đạt được nhiều thành tựu đáng ghi nhận và được nhiều Quý khách hàng lựa chọn là địa chỉ mua sắm online uy tín, chất lượng và giá cả hợp lý.</p>

                            <p>
                                <strong>Sky Market</strong>&nbsp;là website thương mại điện tử bán lẻ hàng tiêu dùng - mỹ phẩm Thái Lan tại Việt Nam. Hàng hóa tại&nbsp;<strong>Sky Market</strong>&nbsp;&nbsp;đảm bảo 100% nhập khẩu với các thương hiệu nổi tiểng sản xuất tại nước Thái Lan như&nbsp;Nivea, Clear, Dove, Siam Botanicals, Thamn ...<br>
                                <br>
                                Với mục tiêu mang đến cho khách hàng sản phẩm và dịch vụ tốt nhất, làm hài lòng cả những khách hàng khó tính,&nbsp;<strong>Sky Market</strong>&nbsp;cập nhật thường xuyên sản phẩm và dịch vụ mới nhất, mang đến khách hàng sự hài lòng. Cùng hàng trăm chủng loại hàng hóa tiêu dùng nổi tiếng của Thái Lan,&nbsp;<strong>Sky Market</strong>&nbsp;cung cấp đến khách hàng đa dạng các loại sản phẩm từ sản phẩm chăm sóc cơ thể, chăm sóc tóc và các sản phẩm nhu thiết yếu cần thiết trong nhà tắm, nhà bếp ...
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Page Content -->
</asp:Content>
