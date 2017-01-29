.class Lcom/club_ciclista/valverdedejucar/MainActivity$4;
.super Landroid/webkit/WebChromeClient;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/club_ciclista/valverdedejucar/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Lcom/club_ciclista/valverdedejucar/MainActivity;

.field private c:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/club_ciclista/valverdedejucar/MainActivity;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    iput-object p2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->a:Landroid/content/Context;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public getVideoLoadingProgressView()Landroid/view/View;
    .locals 3

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->c:Landroid/view/View;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030002

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->c:Landroid/view/View;

    :cond_0
    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->c:Landroid/view/View;

    return-object v0
.end method

.method public onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->lineNumber()I

    move-result v1

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->sourceId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->onConsoleMessage(Ljava/lang/String;ILjava/lang/String;)V

    const/4 v0, 0x1

    return v0
.end method

.method public onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-interface {p2, p1, v0, v1}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    return-void
.end method

.method public onHideCustomView()V
    .locals 3

    const/16 v2, 0x8

    invoke-super {p0}, Landroid/webkit/WebChromeClient;->onHideCustomView()V

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->a(Lcom/club_ciclista/valverdedejucar/MainActivity;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    iget-object v0, v0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->b(Lcom/club_ciclista/valverdedejucar/MainActivity;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->a(Lcom/club_ciclista/valverdedejucar/MainActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->b(Lcom/club_ciclista/valverdedejucar/MainActivity;)Landroid/widget/FrameLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v1}, Lcom/club_ciclista/valverdedejucar/MainActivity;->a(Lcom/club_ciclista/valverdedejucar/MainActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->c(Lcom/club_ciclista/valverdedejucar/MainActivity;)Landroid/webkit/WebChromeClient$CustomViewCallback;

    move-result-object v0

    invoke-interface {v0}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/club_ciclista/valverdedejucar/MainActivity;->a(Lcom/club_ciclista/valverdedejucar/MainActivity;Landroid/view/View;)Landroid/view/View;

    goto :goto_0
.end method

.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-virtual {v1}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070003

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x104000a

    new-instance v2, Lcom/club_ciclista/valverdedejucar/MainActivity$4$1;

    invoke-direct {v2, p0, p4}, Lcom/club_ciclista/valverdedejucar/MainActivity$4$1;-><init>(Lcom/club_ciclista/valverdedejucar/MainActivity$4;Landroid/webkit/JsResult;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    const/4 v0, 0x1

    return v0
.end method

.method public onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->a:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-virtual {v1}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070003

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x104000a

    new-instance v2, Lcom/club_ciclista/valverdedejucar/MainActivity$4$3;

    invoke-direct {v2, p0, p4}, Lcom/club_ciclista/valverdedejucar/MainActivity$4$3;-><init>(Lcom/club_ciclista/valverdedejucar/MainActivity$4;Landroid/webkit/JsResult;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    new-instance v2, Lcom/club_ciclista/valverdedejucar/MainActivity$4$2;

    invoke-direct {v2, p0, p4}, Lcom/club_ciclista/valverdedejucar/MainActivity$4$2;-><init>(Lcom/club_ciclista/valverdedejucar/MainActivity$4;Landroid/webkit/JsResult;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    const/4 v0, 0x1

    return v0
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 4

    const/16 v3, 0x64

    const/16 v2, 0x8

    if-ge p2, v3, :cond_0

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    iget-object v0, v0, Lcom/club_ciclista/valverdedejucar/MainActivity;->e:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    iget-object v0, v0, Lcom/club_ciclista/valverdedejucar/MainActivity;->e:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_0
    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    iget-object v0, v0, Lcom/club_ciclista/valverdedejucar/MainActivity;->e:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p2}, Landroid/widget/ProgressBar;->setProgress(I)V

    if-ne p2, v3, :cond_1

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    iget-object v0, v0, Lcom/club_ciclista/valverdedejucar/MainActivity;->e:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method public onShowCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 0

    invoke-virtual {p0, p1, p3}, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V

    return-void
.end method

.method public onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 2

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->a(Lcom/club_ciclista/valverdedejucar/MainActivity;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p2}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v0, p1}, Lcom/club_ciclista/valverdedejucar/MainActivity;->a(Lcom/club_ciclista/valverdedejucar/MainActivity;Landroid/view/View;)Landroid/view/View;

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    iget-object v0, v0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->b(Lcom/club_ciclista/valverdedejucar/MainActivity;)Landroid/widget/FrameLayout;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->b(Lcom/club_ciclista/valverdedejucar/MainActivity;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v0, p2}, Lcom/club_ciclista/valverdedejucar/MainActivity;->a(Lcom/club_ciclista/valverdedejucar/MainActivity;Landroid/webkit/WebChromeClient$CustomViewCallback;)Landroid/webkit/WebChromeClient$CustomViewCallback;

    goto :goto_0
.end method

.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/ValueCallback",
            "<[",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            ")Z"
        }
    .end annotation

    const/4 v7, 0x0

    const/4 v1, 0x0

    const/4 v6, 0x1

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->d(Lcom/club_ciclista/valverdedejucar/MainActivity;)Landroid/webkit/ValueCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->d(Lcom/club_ciclista/valverdedejucar/MainActivity;)Landroid/webkit/ValueCallback;

    move-result-object v0

    invoke-interface {v0, v1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v0, p2}, Lcom/club_ciclista/valverdedejucar/MainActivity;->a(Lcom/club_ciclista/valverdedejucar/MainActivity;Landroid/webkit/ValueCallback;)Landroid/webkit/ValueCallback;

    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-virtual {v2}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v2

    if-eqz v2, :cond_1

    :try_start_0
    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v2}, Lcom/club_ciclista/valverdedejucar/MainActivity;->e(Lcom/club_ciclista/valverdedejucar/MainActivity;)Ljava/io/File;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    :try_start_1
    const-string v2, "PhotoPath"

    iget-object v4, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-static {v4}, Lcom/club_ciclista/valverdedejucar/MainActivity;->f(Lcom/club_ciclista/valverdedejucar/MainActivity;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_0
    if-eqz v3, :cond_2

    iget-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "file:"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/club_ciclista/valverdedejucar/MainActivity;->a(Lcom/club_ciclista/valverdedejucar/MainActivity;Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "output"

    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :cond_1
    :goto_1
    new-instance v2, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "image/*"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    new-instance v3, Landroid/content/Intent;

    const-string v1, "android.media.action.VIDEO_CAPTURE"

    invoke-direct {v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    if-eqz v0, :cond_3

    const/4 v1, 0x2

    new-array v1, v1, [Landroid/content/Intent;

    aput-object v0, v1, v7

    aput-object v3, v1, v6

    move-object v0, v1

    :goto_2
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.CHOOSER"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v3, "android.intent.extra.INTENT"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v2, "android.intent.extra.TITLE"

    const-string v3, "Choose File"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "android.intent.extra.INITIAL_INTENTS"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Landroid/os/Parcelable;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$4;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-virtual {v0, v1, v6}, Lcom/club_ciclista/valverdedejucar/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return v6

    :catch_0
    move-exception v2

    move-object v3, v1

    :goto_3
    invoke-static {}, Lcom/club_ciclista/valverdedejucar/MainActivity;->d()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Image file creation failed"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :cond_2
    move-object v0, v1

    goto :goto_1

    :cond_3
    new-array v0, v7, [Landroid/content/Intent;

    goto :goto_2

    :catch_1
    move-exception v2

    goto :goto_3
.end method
