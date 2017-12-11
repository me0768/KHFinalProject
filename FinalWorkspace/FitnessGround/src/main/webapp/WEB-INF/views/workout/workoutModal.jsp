<!-- video modal -->
				<div class="modal fade" id="workout-modal" tabindex="-1" role="dialog"
					aria-labelledby="myLargeModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
								<h4 class="modal-title" id="myLargeModalLabel">${y.title}<a
										class="anchorjs-link" href="#myLargeModalLabel"><span
										class="anchorjs-icon"></span></a>
								</h4>
							</div>
							<div class="modal-body">
								<div class="modal-play">
									<iframe id="video-play"
										src="https://www.youtube.com/embed/${y.url}" frameborder="0"
										gesture="media" allow="encrypted-media" allowfullscreen></iframe>
								</div>
								<div class="modal-desc">
									<div id="video-content">
										<span>${y.content }</span>
									</div>
									<div id="video-reply">
										<input type="text" id="reply-input" placeholder="댓글을 입력하세요">
										<button type="submit" id="reply-btn">댓글달기</button>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>