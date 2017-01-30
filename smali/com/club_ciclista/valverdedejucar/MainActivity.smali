.class public Lcom/club_ciclista/valverdedejucar/MainActivity;
.super Landroid/app/Activity;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/club_ciclista/valverdedejucar/MainActivity$a;
    }
.end annotation


# static fields
.field private static final h:Ljava/lang/String;


# instance fields
.field a:Landroid/webkit/WebView;

.field b:Landroid/widget/ImageView;

.field c:Ljava/lang/String;

.field d:Ljava/lang/String;

.field e:Landroid/widget/ProgressBar;

.field f:Landroid/webkit/WebChromeClient;

.field public g:Z

.field private i:Ljava/lang/String;

.field private j:Landroid/webkit/ValueCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/webkit/ValueCallback",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private k:Landroid/webkit/ValueCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/webkit/ValueCallback",
            "<[",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private l:Landroid/widget/FrameLayout;

.field private m:Landroid/webkit/WebChromeClient$CustomViewCallback;

.field private n:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/club_ciclista/valverdedejucar/MainActivity;->h:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->g:Z

    return-void
.end method

.method static synthetic a(Lcom/club_ciclista/valverdedejucar/MainActivity;)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->n:Landroid/view/View;

    return-object v0
.end method

.method static synthetic a(Lcom/club_ciclista/valverdedejucar/MainActivity;Landroid/view/View;)Landroid/view/View;
    .locals 0

    iput-object p1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->n:Landroid/view/View;

    return-object p1
.end method

.method static synthetic a(Lcom/club_ciclista/valverdedejucar/MainActivity;Landroid/webkit/ValueCallback;)Landroid/webkit/ValueCallback;
    .locals 0

    iput-object p1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->k:Landroid/webkit/ValueCallback;

    return-object p1
.end method

.method static synthetic a(Lcom/club_ciclista/valverdedejucar/MainActivity;Landroid/webkit/WebChromeClient$CustomViewCallback;)Landroid/webkit/WebChromeClient$CustomViewCallback;
    .locals 0

    iput-object p1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->m:Landroid/webkit/WebChromeClient$CustomViewCallback;

    return-object p1
.end method

.method static synthetic a(Lcom/club_ciclista/valverdedejucar/MainActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->i:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic b(Lcom/club_ciclista/valverdedejucar/MainActivity;)Landroid/widget/FrameLayout;
    .locals 1

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->l:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic c(Lcom/club_ciclista/valverdedejucar/MainActivity;)Landroid/webkit/WebChromeClient$CustomViewCallback;
    .locals 1

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->m:Landroid/webkit/WebChromeClient$CustomViewCallback;

    return-object v0
.end method

.method static synthetic d(Lcom/club_ciclista/valverdedejucar/MainActivity;)Landroid/webkit/ValueCallback;
    .locals 1

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->k:Landroid/webkit/ValueCallback;

    return-object v0
.end method

.method static synthetic d()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/club_ciclista/valverdedejucar/MainActivity;->h:Ljava/lang/String;

    return-object v0
.end method

.method private e()Ljava/io/File;
    .locals 3

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd_HHmmss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "img_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    const-string v2, ".jpg"

    invoke-static {v0, v2, v1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method static synthetic e(Lcom/club_ciclista/valverdedejucar/MainActivity;)Ljava/io/File;
    .locals 1

    invoke-direct {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->e()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method static synthetic f(Lcom/club_ciclista/valverdedejucar/MainActivity;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->i:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 5

    const/16 v4, 0x400

    const/16 v3, 0x13

    const/16 v2, 0x10

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f05000c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v0, v2, :cond_1

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v4, v4}, Landroid/view/Window;->setFlags(II)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v2, :cond_2

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v1, v3, :cond_2

    const/16 v1, 0x704

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_0

    :cond_2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v3, :cond_0

    const/16 v1, 0xd04

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_0
.end method

.method public b()Ljava/lang/Void;
    .locals 4

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f050009

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Are you sure to exit?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x104000a

    new-instance v2, Lcom/club_ciclista/valverdedejucar/MainActivity$8;

    invoke-direct {v2, p0}, Lcom/club_ciclista/valverdedejucar/MainActivity$8;-><init>(Lcom/club_ciclista/valverdedejucar/MainActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :goto_0
    return-object v3

    :cond_0
    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->finish()V

    goto :goto_0
.end method

.method public c()V
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f07000c

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    const-string v1, "About"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6

    const/4 v5, 0x0

    const/4 v4, -0x1

    const/4 v1, 0x0

    const/4 v3, 0x1

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v0, v2, :cond_3

    if-ne p2, v4, :cond_6

    if-ne p1, v3, :cond_6

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->k:Landroid/webkit/ValueCallback;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-nez p3, :cond_2

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->i:Ljava/lang/String;

    if-eqz v0, :cond_6

    new-array v0, v3, [Landroid/net/Uri;

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->i:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    aput-object v2, v0, v5

    :goto_1
    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->k:Landroid/webkit/ValueCallback;

    invoke-interface {v2, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->k:Landroid/webkit/ValueCallback;

    goto :goto_0

    :cond_2
    invoke-virtual {p3}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    new-array v0, v3, [Landroid/net/Uri;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    aput-object v2, v0, v5

    goto :goto_1

    :cond_3
    if-ne p1, v3, :cond_0

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->j:Landroid/webkit/ValueCallback;

    if-eqz v0, :cond_0

    if-eqz p3, :cond_4

    if-eq p2, v4, :cond_5

    :cond_4
    move-object v0, v1

    :goto_2
    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->j:Landroid/webkit/ValueCallback;

    invoke-interface {v2, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->j:Landroid/webkit/ValueCallback;

    goto :goto_0

    :cond_5
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    goto :goto_2

    :cond_6
    move-object v0, v1

    goto :goto_1
.end method

.method public onBackPressed()V
    .locals 4

    iget-boolean v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->g:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f05000a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->b()Ljava/lang/Void;

    :goto_0
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lcom/club_ciclista/valverdedejucar/MainActivity$7;

    invoke-direct {v1, p0}, Lcom/club_ciclista/valverdedejucar/MainActivity$7;-><init>(Lcom/club_ciclista/valverdedejucar/MainActivity;)V

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_0
    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->g:Z

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->b()Ljava/lang/Void;

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 11

    const v10, 0x7f050005

    const/high16 v9, 0x2000000

    const/16 v8, 0x13

    const/4 v7, 0x2

    const/4 v6, 0x1

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/high16 v0, 0x7f030000

    invoke-virtual {p0, v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->setContentView(I)V

    const v0, 0x7f0a0001

    invoke-virtual {p0, v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    iput-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    const v0, 0x7f0a0003

    invoke-virtual {p0, v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->b:Landroid/widget/ImageView;

    const/high16 v0, 0x7f0a0000

    invoke-virtual {p0, v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->l:Landroid/widget/FrameLayout;

    const v0, 0x7f0a0002

    invoke-virtual {p0, v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->e:Landroid/widget/ProgressBar;

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f05000b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->a()V

    const-string v1, "file:///android_asset/index.html"

    iput-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->c:Ljava/lang/String;

    :try_start_0
    new-instance v1, Ljava/net/URL;

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->c:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->d:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setVisibility(I)V

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->b:Landroid/widget/ImageView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    new-instance v3, Lcom/club_ciclista/valverdedejucar/MainActivity$1;

    invoke-direct {v3, p0}, Lcom/club_ciclista/valverdedejucar/MainActivity$1;-><init>(Lcom/club_ciclista/valverdedejucar/MainActivity;)V

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const/high16 v5, 0x7f060000

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/high16 v3, 0x7f050000

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/high16 v3, 0x7f070000

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "NoCache"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {v1, v7}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    :goto_1
    sget-object v2, Landroid/webkit/WebSettings$RenderPriority;->HIGH:Landroid/webkit/WebSettings$RenderPriority;

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setRenderPriority(Landroid/webkit/WebSettings$RenderPriority;)V

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v8, :cond_7

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    const/4 v3, 0x0

    invoke-virtual {v2, v7, v3}, Landroid/webkit/WebView;->setLayerType(ILandroid/graphics/Paint;)V

    :cond_0
    :goto_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/data/data"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/cache"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setAppCachePath(Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    invoke-virtual {v2, v9}, Landroid/webkit/WebView;->setScrollBarStyle(I)V

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f050004

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setSaveFormData(Z)V

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f050007

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f050002

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    sget-object v2, Landroid/webkit/WebSettings$PluginState;->ON:Landroid/webkit/WebSettings$PluginState;

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setPluginState(Landroid/webkit/WebSettings$PluginState;)V

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    invoke-virtual {v2, v6}, Landroid/webkit/WebView;->setHapticFeedbackEnabled(Z)V

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v10}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v10}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f050001

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setLongClickable(Z)V

    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setGeolocationEnabled(Z)V

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v8, :cond_1

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f05000e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {v6}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V

    :cond_1
    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    new-instance v3, Lcom/club_ciclista/valverdedejucar/MainActivity$a;

    invoke-direct {v3, p0, p0}, Lcom/club_ciclista/valverdedejucar/MainActivity$a;-><init>(Lcom/club_ciclista/valverdedejucar/MainActivity;Landroid/content/Context;)V

    const-string v4, "Website2APK"

    invoke-virtual {v2, v3, v4}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    new-instance v3, Lcom/club_ciclista/valverdedejucar/MainActivity$2;

    invoke-direct {v3, p0}, Lcom/club_ciclista/valverdedejucar/MainActivity$2;-><init>(Lcom/club_ciclista/valverdedejucar/MainActivity;)V

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v2, v3, :cond_2

    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    :cond_2
    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    iget-object v3, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->c:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    invoke-virtual {v2}, Landroid/webkit/WebView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    new-instance v3, Lcom/club_ciclista/valverdedejucar/MainActivity$3;

    invoke-direct {v3, p0}, Lcom/club_ciclista/valverdedejucar/MainActivity$3;-><init>(Lcom/club_ciclista/valverdedejucar/MainActivity;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    invoke-virtual {v2, v9}, Landroid/webkit/WebView;->setScrollBarStyle(I)V

    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f05000d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f050008

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/webkit/CookieManager;->setAcceptCookie(Z)V

    invoke-virtual {v1}, Landroid/webkit/CookieManager;->acceptCookie()Z

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-le v2, v3, :cond_3

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    invoke-virtual {v1, v2, v6}, Landroid/webkit/CookieManager;->setAcceptThirdPartyCookies(Landroid/webkit/WebView;Z)V

    :cond_3
    if-eqz p1, :cond_4

    iget-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    invoke-virtual {v1, p1}, Landroid/webkit/WebView;->restoreState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;

    :cond_4
    new-instance v1, Lcom/club_ciclista/valverdedejucar/MainActivity$4;

    invoke-direct {v1, p0, p0}, Lcom/club_ciclista/valverdedejucar/MainActivity$4;-><init>(Lcom/club_ciclista/valverdedejucar/MainActivity;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->f:Landroid/webkit/WebChromeClient;

    iget-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->f:Landroid/webkit/WebChromeClient;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    iget-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    new-instance v2, Lcom/club_ciclista/valverdedejucar/MainActivity$5;

    invoke-direct {v2, p0, v0}, Lcom/club_ciclista/valverdedejucar/MainActivity$5;-><init>(Lcom/club_ciclista/valverdedejucar/MainActivity;Ljava/lang/Boolean;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    new-instance v1, Lcom/club_ciclista/valverdedejucar/MainActivity$6;

    invoke-direct {v1, p0}, Lcom/club_ciclista/valverdedejucar/MainActivity$6;-><init>(Lcom/club_ciclista/valverdedejucar/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    return-void

    :catch_0
    move-exception v1

    const-string v1, "Error"

    iput-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->d:Ljava/lang/String;

    goto/16 :goto_0

    :cond_5
    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/high16 v3, 0x7f070000

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "HighCache"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    goto/16 :goto_1

    :cond_6
    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    goto/16 :goto_1

    :cond_7
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_0

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    const/4 v3, 0x0

    invoke-virtual {v2, v6, v3}, Landroid/webkit/WebView;->setLayerType(ILandroid/graphics/Paint;)V

    goto/16 :goto_2
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f090000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5

    const/4 v0, 0x1

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.SEND"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const v3, 0x7f0a0006

    if-ne v1, v3, :cond_0

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->finish()V

    :goto_0
    return v0

    :cond_0
    const v3, 0x7f0a0005

    if-ne v1, v3, :cond_1

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->c()V

    goto :goto_0

    :cond_1
    const v3, 0x7f0a0007

    if-ne v1, v3, :cond_2

    const-string v1, "text/plain"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.SUBJECT"

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f070009

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.TEXT"

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f07000a

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "Share via"

    invoke-static {v2, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/club_ciclista/valverdedejucar/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :cond_2
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method public onPause()V
    .locals 1

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onPause()V

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-virtual {p0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->a()V

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity;->a:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onResume()V

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    return-void
.end method
