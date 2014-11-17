<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/resources/web/notification/envelope.png" var="envelopeImg"/>
<c:url value="/resources/web/notification/error-icon.png" var="errorImg"/>
<c:url value="/resources/web/notification/success-icon.png" var="successImg"/>

<demo:header />

<kendo:notification name="notification" autoHideAfter="0" stacking="down">
	<kendo:notification-templates>
		<kendo:notification-template type="info" template="emailTemplate"/>
		<kendo:notification-template type="error" template="errorTemplate"/>
		<kendo:notification-template type="upload-success" template="successTemplate"/>
	</kendo:notification-templates>
	<kendo:notification-position pinned="true" top="30" right="30" />
</kendo:notification>
    
<div class="demo-section">
    
    <h3>Show notification:</h3>
    <p>
        <button id="showEmailNotification" class="k-button">Email Notification</button><br />
        <button id="showErrorNotification" class="k-button">Error Notification</button><br />
        <button id="showSuccessNotification" class="k-button">Upload Success Notification</button>
    </p>
    <h3>Hide notification:</h3>
    <p>
        <button id="hideAllNotifications" class="k-button">Hide All Notifications</button>
    </p>

</div>

<script id="emailTemplate" type="text/x-kendo-template">        
                <div class="new-mail">
                    <img src="${envelopeImg}" />
                    <h3>#= title #</h3>
                    <p>#= message #</p>
                </div>
            </script>

<script id="errorTemplate" type="text/x-kendo-template">        
                <div class="wrong-pass">
                    <img src="${errorImg}" />
                    <h3>#= title #</h3>
                    <p>#= message #</p>
                </div>
            </script>

<script id="successTemplate" type="text/x-kendo-template">        
                <div class="upload-success">
                    <img src="${successImg}" />
                    <h3>#= message #</h3>
                </div>
            </script>

<script>
    $(document).ready(function() {

        var notification = $("#notification").data("kendoNotification");

        $("#showEmailNotification").click(function(){
            notification.show({
                title: "New E-mail",
                message: "You have 1 new mail message!"
            }, "info");
        });
        
        $("#showErrorNotification").click(function(){
            notification.show({
                title: "Wrong Password",
                message: "Please enter your password again."
            }, "error");
        });
        
        $("#showSuccessNotification").click(function(){
            notification.show({
                message: "Upload Successful"
            }, "upload-success");
        });

        $("#hideAllNotifications").click(function(){
            notification.hide();
        });

    });
</script>

<style>
    .demo-section {
        width: 200px;
        padding: 20px 30px;
    }
    .demo-section p {
        margin: 3px 0 20px;
        line-height: 40px;
    }
    .demo-section .k-button {
        width: 200px;
    }
    
    .k-notification {
        border: 0;
    }
    
    
    /* Info template */
    .k-notification-info.k-group {
        background: rgba(0%,0%,0%,.7);
        color: #fff;
    }
    .new-mail {
        width: 300px;
        height: 100px;
    }
    .new-mail h3 {
        font-size: 1em;
        padding: 32px 10px 5px;
    }
    .new-mail img {
        float: left;
        margin: 30px 15px 30px 30px;
    }
    
    /* Error template */
    .k-notification-error.k-group {
        background: rgba(100%,0%,0%,.7);
        color: #ffffff;
    }
    .wrong-pass {
        width: 300px;
        height: 100px;
    }
    .wrong-pass h3 {
        font-size: 1em;
        padding: 32px 10px 5px;
    }
    .wrong-pass img {
        float: left;
        margin: 30px 15px 30px 30px;
    }
    
    /* Success template */
    .k-notification-upload-success.k-group {
        background: rgba(0%,60%,0%,.7);
        color: #fff;
    }
    .upload-success {
        width: 240px;
        height: 100px;
        padding: 0 30px;
        line-height: 100px;
    }
    .upload-success h3 {
        font-size: 1.7em;
        font-weight: normal;
        display: inline-block;
        vertical-align: middle;
    }
    .upload-success img {
        display: inline-block;
        vertical-align: middle;
        margin-right: 10px;
    }
</style>

<demo:footer />