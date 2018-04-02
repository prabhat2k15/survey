@extends('layouts.app')

@section('content')
<center>
    <h1> Student Survey</h1>
</center>

<hr>

<div class="container">
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
    @if (session('status'))
        <div class="alert alert-success">
            {{ session('status') }}
        </div>
    @endif
    <form class="form-horizontal" method="POST" action="{{route('saveanswer')}}">
        {{csrf_field()}}
        @foreach($question as $q)
        <div class="row">
            <strong><div class="col-xs-11">{{$q->id}}.) {{$q->name}}</div></strong>
        </div>
        @foreach($option[$q->id] as $o)
        <div class="row">
            <div class="col-xs-10"><input type="radio" name="{{$q->id}}" value="{{$o->id}}" required> {{$o->options}}</div>
        </div>
        @endforeach
        <br><br>
        @endforeach
        <input type="hidden" name="page" value="{{$question->currentPage()}}">
        <button type="submit">{{$question->hasMorePages() ? 'Next Question' : 'Submit'}}</button>
    </from>
</div>

@endsection