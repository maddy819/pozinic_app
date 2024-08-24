@extends('layouts.admin')

@section('content')
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>{{$pageTitle}}</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{ route('admin-dashboard') }}">Home</a></li>
              <li class="breadcrumb-item active">{{$pageTitle}}</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <a class="btn btn-sm btn-success float-right" href="#" data-toggle="modal" data-target="#modal-question">Post Question</a>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                    <tr>
                        <th>Question</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($questions as $quest)
                    <tr>
                        <td>{{ $quest->question }}</td>
                        <td>
                            <div class="dropdown">
                                <button type="button" class="btn btn-icon btn-sm btn-secondary btn-rounded btn-outline-secondary" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a title="Edit Question" class="dropdown-item" href="#" onclick="edit_question({{ $quest->id }})">Edit Question</a>
                                    <a title="Delete Question" class="dropdown-item" href="{{ route('admin-delete-question', [$quest->id]) }}" onclick="return confirm('Are you sure?')">Delete Question</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <th>Question</th>
                        <th>Action</th>
                    </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->

    <!-- page script -->
    <div class="modal modal-primary fade" id="modal-question" data-backdrop="static" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title">Post New Question</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="question_post" action="javascript:void(0)" method="post" enctype="multipart/form-data">@csrf
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="title">Question:</label>
                                    <input type="hidden" name="id" class="form-control" id="id">
                                    <textarea name="question" class="form-control" id="question" placeholder="Question"></textarea>
                                </div>
                            </div>

                            <hr style="width:100%; height:5px; color:black">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="category" class="featured">Answer 1:</label>
                                    <input type="hidden" name="answer_id[]" class="form-control" id="answer_id_1">
                                    <textarea name="answer[]" class="form-control" id="answer_1" placeholder="Answer 1"></textarea>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Answer 1 Explanation:</label>
                                    <textarea name="answer_explanation[]" class="form-control" id="answer_1_explanation" placeholder="Answer 1 Explanation"></textarea>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="category" class="featured">Answer 2:</label>
                                    <input type="hidden" name="answer_id[]" class="form-control" id="answer_id_2">
                                    <textarea name="answer[]" class="form-control" id="answer_2" placeholder="Answer 2"></textarea>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Answer 2 Explanation:</label>
                                    <textarea name="answer_explanation[]" class="form-control" id="answer_2_explanation" placeholder="Answer 2 Explanation"></textarea>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="category" class="featured">Answer 3:</label>
                                    <input type="hidden" name="answer_id[]" class="form-control" id="answer_id_3">
                                    <textarea name="answer[]" class="form-control" id="answer_3" placeholder="Answer 3"></textarea>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Answer 3 Explanation:</label>
                                    <textarea name="answer_explanation[]" class="form-control" id="answer_3_explanation" placeholder="Answer 3 Explanation"></textarea>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="category" class="featured">Answer 4:</label>
                                    <input type="hidden" name="answer_id[]" class="form-control" id="answer_id_4">
                                    <textarea name="answer[]" class="form-control" id="answer_4" placeholder="Answer 4"></textarea>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="title">Answer 4 Explanation:</label>
                                    <textarea name="answer_explanation[]" class="form-control" id="answer_4_explanation" placeholder="Answer 4 Explanation"></textarea>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="submit" id="send_form" name="save" class="btn btn-primary" value="Post Question">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
@endsection

@section('script')

@if(Session::has('error'))
    <script>
      toastr.error('{{Session::get("error")}}');
    </script>
@endif

@if(Session::has('success'))
    <script>
      toastr.success('{{Session::get("success")}}');
    </script>
@endif

<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true, 
            "lengthChange": false, 
            "autoWidth": false, 
            "info": true,
            "lengthChange": true,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

        $('#short_description').summernote({
            height: 100,
            placeholder: 'Short Description',
        });

        $('#modal-question').on('hidden.bs.modal', function (e) {
            $('#question_post').trigger('reset');
        })
    });

    $("#question_post").validate({
        ignore: "",
        rules: {
            question: {
                required: true,
            },
            answer_1: {
                required: true,
            },
            answer_2: {
                required: true,
            },
        },
        messages: {
            name: "Please Enter Question",
            answer_1: "Please Enter Answer 1",
            answer_2: "Please Enter Answer 2",
        },
        submitHandler: function(form) {
            $.ajaxSetup({ headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') } });

            var form = $('#question_post')[0];
            var data = new FormData(form);

            $.ajax({
                url: "{{ route('admin-store-questions') }}",
                enctype: 'multipart/form-data',
                type: "POST",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                success: function( response ) {
                    console.log(response);
                    if(response.success) {
                        $('#question_post').trigger('reset');
                        $('#short_description').summernote('reset');
                        $('#modal-question').modal('hide');
                        window.setTimeout(function(){location.reload()},1500)
                        Swal.fire({ icon: 'success', title: response.success, showConfirmButton: false, timer: 1500 });
                    } else {
                        Swal.fire({ icon: 'error', title: response.error, showConfirmButton: false, timer: 1500 });
                    }
                },
                error: function(error) {
                    console.log(error);
                    Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
                }
            });
        }
    });

    function edit_question(questId) {
        var _token = $("input[name=_token]").val();
        $.ajax({
            type: "POST", 
            url: "{{ route('admin-edit-question') }}",
            data: { _token: _token, questId: questId },
            cache: false, 
            dataType: "json",
            success: function(detail){
                console.log(detail.answers);
                $('#question_post').trigger('reset');
                $("#id").val(detail.id);
                $("#question").val(detail.question);

                $("#answer_id_1").val(detail.answers[0].id);
                $("#answer_1").val(detail.answers[0].answer);
                $("#answer_1_explanation").val(detail.answers[0].answer_explanation);

                $("#answer_id_2").val(detail.answers[1].id);
                $("#answer_2").val(detail.answers[1].answer);
                $("#answer_2_explanation").val(detail.answers[1].answer_explanation);

                if(typeof detail.answers[2] != "undefined") {
                    $("#answer_id_3").val(detail.answers[2].id);
                    $("#answer_3").val(detail.answers[2].answer);
                    $("#answer_3_explanation").val(detail.answers[2].answer_explanation);
                }

                if(typeof detail.answers[3] != "undefined") {
                    $("#answer_id_4").val(detail.answers[3].id);
                    $("#answer_4").val(detail.answers[3].answer);
                    $("#answer_4_explanation").val(detail.answers[3].answer_explanation);
                }
                
                $('#send_form').attr({value: "Update Question"});
                $("#modal-question").modal('show');
            },
            error: function(error) {
                console.log(error);
                Swal.fire({ icon: 'error', title: 'Some error occoured. plz try again', showConfirmButton: false, timer: 1500 });
            }
        });
    }
</script>
@endsection