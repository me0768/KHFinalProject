
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="com.kh.fitnessground.workout.yoga.model.vo.Yoga, java.util.List"%>


<c:import url="../include/common/head.jsp" />
<link rel="stylesheet" href="/fitnessground/resources/css/bootstrap.css">
<script type="text/javascript" src="/fitnessground/resources/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/fitnessground/resources/js/bootstrap.js"></script>

<script type="text/javascript" src="/fitnessground/resources/js/common/jquery.scrolly.min.js"></script>
<script type="text/javascript" src="/fitnessground/resources/js/common/jquery.dropotron.min.js"></script>
<script type="text/javascript" src="/fitnessground/resources/js/common/jquery.onvisible.min.js"></script>
</head>
<body class="homepage">

<!-- Modal -->
	<c:import url="workoutModal.jsp" />

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#testModal" data-whatever="@mdo">Open modal for @mdo</button>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#testModal" data-whatever="@fat">Open modal for @fat</button>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#testModal" data-whatever="@getbootstrap">Open modal for @getbootstrap</button>


<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">Recipient:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>

	<!-- modal 띄우기 -->
	<script type="text/javascript">
	$('#testModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget); // Button that triggered the modal
		  var recipient = button.data('whatever'); // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  console.log(recipient)
		  var modal = $(this);
		  modal.find('.modal-title').text('New message to ' + recipient);
		  modal.find('.modal-body input').val(recipient);
		})
		</script>