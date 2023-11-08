// 자바스크립트 함수
function checkSelectAll() {
    var checkboxes = document.querySelectorAll('.checkbox-input[name="delete_checkbox"]');
    var selectAllCheckbox = document.getElementById('select_all_checkbox');
    
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = selectAllCheckbox.checked;
    }
}

function checkSelect() {
    var checkboxes = document.querySelectorAll('.checkbox-input[name="delete_checkbox"]');
    var selectAllCheckbox = document.getElementById('select_all_checkbox');
    var allChecked = true;

    for (var i = 0; i < checkboxes.length; i++) {
        if (!checkboxes[i].checked) {
            allChecked = false;
            break;
        }
    }

    selectAllCheckbox.checked = allChecked;
}


function deleteSelectedKanban() {
    var selectedIds = [];

    // 선택된 체크박스를 확인하고 ID를 배열에 추가합니다.
    $('.checkbox-input[name="delete_checkbox"]:checked').each(function() {
        selectedIds.push($(this).val());
    });

    console.log(selectedIds);

    if (selectedIds.length > 0) {
        // AJAX를 사용하여 게시물 삭제 요청을 서버에 전송합니다.
        $.ajax({
            type: 'POST',
            url: '/myPage/deleteKanban',
            data: { deleteIds: selectedIds },
            success: function(response) {
                alert(response.message);
                if (response.status) {
                    // 삭제 후 페이지를 다시로드합니다.
                    location.reload();
                } 
            }
        });
    } else {
        alert('삭제할 항목을 선택해 주세요.');
    }
}


$(document).ready(function() {
    // 모든 삭제 버튼에 대한 클릭 핸들러를 할당
    $(".delete_kanban").click(function() {
        var boardId = $(this).data("board-id");
		
        // 모달 대화 상자를 열고 boardId 데이터를 설정
        $("#deleteKanbanForm").data("board-id", boardId).dialog("open");
    });

    // 모달 대화 상자 설정
    $("#deleteKanbanForm").dialog({
        autoOpen: false,
        modal: true,
        width: 400,
        buttons: {
            "Yes": function() {
                var boardId = $(this).data("board-id");
				
                // AJAX를 사용하여 게시물 삭제 요청을 서버에 전송
                $.ajax({
                    type: 'POST',
                    url: '/myPage/deleteKanban',
                    data: { deleteIds: [boardId] },
                    success: function(response) {
                        alert(response.message);
                        if (response.status) {
                            // 삭제 후 페이지를 다시로드
                            location.reload();
                        }
                    },
                    error: function() {
                        alert(response.message);
                    }
                });

                // 모달 대화 상자 닫기
                $(this).dialog("close");
            },
            "No": function() {
                // 모달 대화 상자 닫기
                $(this).dialog("close");
            }
        }
    });
});

