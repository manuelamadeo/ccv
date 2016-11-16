.class Lorg/apache/cordova/splashscreen/SplashScreen$4$1;
.super Ljava/lang/Object;
.source "SplashScreen.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/splashscreen/SplashScreen$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/splashscreen/SplashScreen$4;


# direct methods
.method constructor <init>(Lorg/apache/cordova/splashscreen/SplashScreen$4;)V
    .locals 0
    .param p1, "this$1"    # Lorg/apache/cordova/splashscreen/SplashScreen$4;

    .prologue
    .line 230
    iput-object p1, p0, Lorg/apache/cordova/splashscreen/SplashScreen$4$1;->this$1:Lorg/apache/cordova/splashscreen/SplashScreen$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    const/4 v1, 0x0

    .line 238
    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;
    invoke-static {}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$100()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;
    invoke-static {}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$100()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 239
    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;
    invoke-static {}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$100()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 240
    # setter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;
    invoke-static {v1}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$102(Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 241
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen$4$1;->this$1:Lorg/apache/cordova/splashscreen/SplashScreen$4;

    iget-object v0, v0, Lorg/apache/cordova/splashscreen/SplashScreen$4;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    # setter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;
    invoke-static {v0, v1}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$302(Lorg/apache/cordova/splashscreen/SplashScreen;Landroid/widget/ImageView;)Landroid/widget/ImageView;

    .line 243
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 247
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 1
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 233
    iget-object v0, p0, Lorg/apache/cordova/splashscreen/SplashScreen$4$1;->this$1:Lorg/apache/cordova/splashscreen/SplashScreen$4;

    iget-object v0, v0, Lorg/apache/cordova/splashscreen/SplashScreen$4;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    # invokes: Lorg/apache/cordova/splashscreen/SplashScreen;->spinnerStop()V
    invoke-static {v0}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$400(Lorg/apache/cordova/splashscreen/SplashScreen;)V

    .line 234
    return-void
.end method
