.class Lorg/apache/cordova/media/AudioHandler$1;
.super Ljava/lang/Object;
.source "AudioHandler.java"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/media/AudioHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/media/AudioHandler;


# direct methods
.method constructor <init>(Lorg/apache/cordova/media/AudioHandler;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/media/AudioHandler;

    .prologue
    .line 422
    iput-object p1, p0, Lorg/apache/cordova/media/AudioHandler$1;->this$0:Lorg/apache/cordova/media/AudioHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .locals 1
    .param p1, "focusChange"    # I

    .prologue
    .line 424
    packed-switch p1, :pswitch_data_0

    .line 436
    :goto_0
    :pswitch_0
    return-void

    .line 428
    :pswitch_1
    iget-object v0, p0, Lorg/apache/cordova/media/AudioHandler$1;->this$0:Lorg/apache/cordova/media/AudioHandler;

    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioHandler;->pauseAllLostFocus()V

    goto :goto_0

    .line 431
    :pswitch_2
    iget-object v0, p0, Lorg/apache/cordova/media/AudioHandler$1;->this$0:Lorg/apache/cordova/media/AudioHandler;

    invoke-virtual {v0}, Lorg/apache/cordova/media/AudioHandler;->resumeAllGainedFocus()V

    goto :goto_0

    .line 424
    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
