package Asking::Controller::Question;
use Mojo::Base 'Asking::Controller::Base';

use DateTime;

sub index {
    my $self = shift;
    
    my $id = $self->param('id') || 0;
    my $question = $self->schema('Question')->find($id);

    if($question){
        
        if($self->is_post){
            my $text = $self->param('answer') || undef;

            my $answer = $self->schema('Answer')->create({
                user_id => $self->current_user->id,
                content => $text,
                created => DateTime->now(time_zone=>'local'),
            });

            if($answer){
                $self->schema('QuestionAnswer')->create({
                    question_id => $question->id,
                    answer_id   => $answer->id,
                });

                # update answers
                $question->update({answers => $question->answers + 1});

                # success
                return $self->redirect_to($self->url_for)
                    if $answer && $answer->in_storage;
            }
        }

        # update views
        $question->update({ viewed => ($question->viewed + 1) });

        # return found question
        return $self->render( question => $question );
    }

    # question not found
    return $self->render_notfound;
}

sub create {
    my $self = shift;

    if($self->is_post){
        my $question_rs = $self->schema('Question');

        my $title       = $self->param('title')     || undef;
        my $content     = $self->param('content')   || undef; 
        my $category    = $self->param('category')  || undef;

        my $question = $question_rs->create({
            title   => $title,
            user_id => ($self->current_user? $self->current_user->id : 1),
            content => $content,
            created => DateTime->now(time_zone=>'local'),
        });

        # add category
        if($question){
            $self->schema('QuestionCategory')->create({
                question_id => $question->id,
                category_id => $category,
            });

            # success
            return $self->render(
                message => {class=>'alert-success', text=>'Question has been created!'}
            );
        }
    
        # error
        return $self->render(
            message => {class=>'alert-danger', text=>'Error saving your question!'}
        );
    }

    return $self->render( message => undef );
}

sub vote_add {
    my $self = shift;
    
    my $id = $self->param('id') || 0;
    my $question = $self->schema('Question')->find($id);

    if($question){
        $question->update({ votes => ($question->votes ||0) + 1 });
    }

    #return $self->redirect_to($self->req->headers->header('referer'));
    return $self->redirect_to('/question/'.$question->id.'/'.$self->string($question->title)->slug);
}
        
sub vote_remove {
    my $self = shift;
    
    my $id = $self->param('id') || 0;
    my $question = $self->schema('Question')->find($id);

    if($question){
        $question->update({ votes => ($question->votes || 0) - 1 });
    }

    #return $self->redirect_to($self->req->headers->header('referer'));
    return $self->redirect_to('/question/'.$question->id.'/'.$self->string($question->title)->slug);
}

1;
