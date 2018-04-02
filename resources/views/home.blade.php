@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Dashboard</div>

                <div class="panel-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif

                    <ul>
                        <li>There are only 2 questions in each page.</li>
                        <li>All questions are mandatory.</li>
                    </ul>
                    Click <a href="{{route('getques')}}">here</a> to start survey.
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
