.class Lorg/apache/cordova/mediacapture/Capture$1;
.super Ljava/lang/Object;
.source "Capture.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/mediacapture/Capture;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/mediacapture/Capture;

.field final synthetic val$intent:Landroid/content/Intent;

.field final synthetic val$req:Lorg/apache/cordova/mediacapture/PendingRequests$Request;


# direct methods
.method constructor <init>(Lorg/apache/cordova/mediacapture/Capture;Lorg/apache/cordova/mediacapture/PendingRequests$Request;Landroid/content/Intent;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/mediacapture/Capture;

    .prologue
    .line 321
    iput-object p1, p0, Lorg/apache/cordova/mediacapture/Capture$1;->this$0:Lorg/apache/cordova/mediacapture/Capture;

    iput-object p2, p0, Lorg/apache/cordova/mediacapture/Capture$1;->val$req:Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    iput-object p3, p0, Lorg/apache/cordova/mediacapture/Capture$1;->val$intent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 324
    iget-object v0, p0, Lorg/apache/cordova/mediacapture/Capture$1;->val$req:Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    iget v0, v0, Lorg/apache/cordova/mediacapture/PendingRequests$Request;->action:I

    packed-switch v0, :pswitch_data_0

    .line 335
    :goto_0
    return-void

    .line 326
    :pswitch_0
    iget-object v0, p0, Lorg/apache/cordova/mediacapture/Capture$1;->this$0:Lorg/apache/cordova/mediacapture/Capture;

    iget-object v1, p0, Lorg/apache/cordova/mediacapture/Capture$1;->val$req:Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    iget-object v2, p0, Lorg/apache/cordova/mediacapture/Capture$1;->val$intent:Landroid/content/Intent;

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/mediacapture/Capture;->onAudioActivityResult(Lorg/apache/cordova/mediacapture/PendingRequests$Request;Landroid/content/Intent;)V

    goto :goto_0

    .line 329
    :pswitch_1
    iget-object v0, p0, Lorg/apache/cordova/mediacapture/Capture$1;->this$0:Lorg/apache/cordova/mediacapture/Capture;

    iget-object v1, p0, Lorg/apache/cordova/mediacapture/Capture$1;->val$req:Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    invoke-virtual {v0, v1}, Lorg/apache/cordova/mediacapture/Capture;->onImageActivityResult(Lorg/apache/cordova/mediacapture/PendingRequests$Request;)V

    goto :goto_0

    .line 332
    :pswitch_2
    iget-object v0, p0, Lorg/apache/cordova/mediacapture/Capture$1;->this$0:Lorg/apache/cordova/mediacapture/Capture;

    iget-object v1, p0, Lorg/apache/cordova/mediacapture/Capture$1;->val$req:Lorg/apache/cordova/mediacapture/PendingRequests$Request;

    iget-object v2, p0, Lorg/apache/cordova/mediacapture/Capture$1;->val$intent:Landroid/content/Intent;

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/mediacapture/Capture;->onVideoActivityResult(Lorg/apache/cordova/mediacapture/PendingRequests$Request;Landroid/content/Intent;)V

    goto :goto_0

    .line 324
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
