.class Lorg/apache/cordova/splashscreen/SplashScreen$5;
.super Ljava/lang/Object;
.source "SplashScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/splashscreen/SplashScreen;->showSplashScreen(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

.field final synthetic val$drawableId:I

.field final synthetic val$effectiveSplashDuration:I

.field final synthetic val$hideAfterDelay:Z


# direct methods
.method constructor <init>(Lorg/apache/cordova/splashscreen/SplashScreen;IZI)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/splashscreen/SplashScreen;

    .prologue
    .line 281
    iput-object p1, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    iput p2, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->val$drawableId:I

    iput-boolean p3, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->val$hideAfterDelay:Z

    iput p4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->val$effectiveSplashDuration:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v6, -0x1

    const/16 v8, 0x400

    .line 284
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    iget-object v4, v4, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 285
    .local v1, "display":Landroid/view/Display;
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    iget-object v4, v4, Lorg/apache/cordova/splashscreen/SplashScreen;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 288
    .local v0, "context":Landroid/content/Context;
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    # setter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;
    invoke-static {v4, v5}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$302(Lorg/apache/cordova/splashscreen/SplashScreen;Landroid/widget/ImageView;)Landroid/widget/ImageView;

    .line 289
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;
    invoke-static {v4}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$300(Lorg/apache/cordova/splashscreen/SplashScreen;)Landroid/widget/ImageView;

    move-result-object v4

    iget v5, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->val$drawableId:I

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 290
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 291
    .local v3, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;
    invoke-static {v4}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$300(Lorg/apache/cordova/splashscreen/SplashScreen;)Landroid/widget/ImageView;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 293
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;
    invoke-static {v4}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$300(Lorg/apache/cordova/splashscreen/SplashScreen;)Landroid/widget/ImageView;

    move-result-object v4

    invoke-virtual {v1}, Landroid/view/Display;->getHeight()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setMinimumHeight(I)V

    .line 294
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;
    invoke-static {v4}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$300(Lorg/apache/cordova/splashscreen/SplashScreen;)Landroid/widget/ImageView;

    move-result-object v4

    invoke-virtual {v1}, Landroid/view/Display;->getWidth()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setMinimumWidth(I)V

    .line 297
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;
    invoke-static {v4}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$300(Lorg/apache/cordova/splashscreen/SplashScreen;)Landroid/widget/ImageView;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;
    invoke-static {v5}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$500(Lorg/apache/cordova/splashscreen/SplashScreen;)Lorg/apache/cordova/CordovaPreferences;

    move-result-object v5

    const-string v6, "backgroundColor"

    const/high16 v7, -0x1000000

    invoke-virtual {v5, v6, v7}, Lorg/apache/cordova/CordovaPreferences;->getInteger(Ljava/lang/String;I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 299
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    # invokes: Lorg/apache/cordova/splashscreen/SplashScreen;->isMaintainAspectRatio()Z
    invoke-static {v4}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$600(Lorg/apache/cordova/splashscreen/SplashScreen;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 301
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;
    invoke-static {v4}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$300(Lorg/apache/cordova/splashscreen/SplashScreen;)Landroid/widget/ImageView;

    move-result-object v4

    sget-object v5, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 309
    :goto_0
    new-instance v4, Landroid/app/Dialog;

    const v5, 0x1030010

    invoke-direct {v4, v0, v5}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    # setter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;
    invoke-static {v4}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$102(Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 311
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    iget-object v4, v4, Lorg/apache/cordova/splashscreen/SplashScreen;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v4

    iget v4, v4, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v4, v4, 0x400

    if-ne v4, v8, :cond_0

    .line 313
    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;
    invoke-static {}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$100()Landroid/app/Dialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4, v8, v8}, Landroid/view/Window;->setFlags(II)V

    .line 316
    :cond_0
    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;
    invoke-static {}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$100()Landroid/app/Dialog;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;
    invoke-static {v5}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$300(Lorg/apache/cordova/splashscreen/SplashScreen;)Landroid/widget/ImageView;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 317
    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;
    invoke-static {}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$100()Landroid/app/Dialog;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 318
    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashDialog:Landroid/app/Dialog;
    invoke-static {}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$100()Landroid/app/Dialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Dialog;->show()V

    .line 320
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->preferences:Lorg/apache/cordova/CordovaPreferences;
    invoke-static {v4}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$700(Lorg/apache/cordova/splashscreen/SplashScreen;)Lorg/apache/cordova/CordovaPreferences;

    move-result-object v4

    const-string v5, "ShowSplashScreenSpinner"

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 321
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    # invokes: Lorg/apache/cordova/splashscreen/SplashScreen;->spinnerStart()V
    invoke-static {v4}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$800(Lorg/apache/cordova/splashscreen/SplashScreen;)V

    .line 325
    :cond_1
    iget-boolean v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->val$hideAfterDelay:Z

    if-eqz v4, :cond_2

    .line 326
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    .line 327
    .local v2, "handler":Landroid/os/Handler;
    new-instance v4, Lorg/apache/cordova/splashscreen/SplashScreen$5$1;

    invoke-direct {v4, p0}, Lorg/apache/cordova/splashscreen/SplashScreen$5$1;-><init>(Lorg/apache/cordova/splashscreen/SplashScreen$5;)V

    iget v5, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->val$effectiveSplashDuration:I

    int-to-long v6, v5

    invoke-virtual {v2, v4, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 335
    .end local v2    # "handler":Landroid/os/Handler;
    :cond_2
    return-void

    .line 305
    :cond_3
    iget-object v4, p0, Lorg/apache/cordova/splashscreen/SplashScreen$5;->this$0:Lorg/apache/cordova/splashscreen/SplashScreen;

    # getter for: Lorg/apache/cordova/splashscreen/SplashScreen;->splashImageView:Landroid/widget/ImageView;
    invoke-static {v4}, Lorg/apache/cordova/splashscreen/SplashScreen;->access$300(Lorg/apache/cordova/splashscreen/SplashScreen;)Landroid/widget/ImageView;

    move-result-object v4

    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0
.end method
