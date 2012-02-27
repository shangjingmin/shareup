class MetadocsController < ApplicationController

  def test
    render :text=>Docshot.first.content
  end

  #docshot
  def shot
    doc = Docshot.shot(params['doc_url']).try(:doc)
    render :json=>{
      :status=>'ok',
      :msg=>"[#{doc.title}] has shot at this site!",
      :doc_url=>doc.url
    }
  end

  def view_shot
    raw_html_doc = Docshot.raw_html_doc(params[:url])
    render :text=>raw_html_doc 
  end

  #Extrac doc
  def extract
    doc_url = params['doc_url'].to_s.strip
    raise "Invalid doc_url:#{doc_url}" if doc_url.blank?
    doc = Pismo[doc_url]
    #standarize here FIXME
    render :json=>{
      :title=>doc.title,
      :abstract=>"     "+doc.description,
      :datetime=>doc.datetime.try(:to_s, :db),
      :authors=>doc.authors,
      :doc_url=>doc.url
    }
  end  

  # GET /metadocs
  # GET /metadocs.json
  def index
    #@metadocs = Metadoc.all
    @search = Metadoc.search do
      keywords params[:query]
      order_by :collect_at, :desc
      paginate :page=>params[:page], :per_page=>15
    end
    @metadocs = @search.results

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @metadocs }
    end
  end

  # GET /metadocs/1
  # GET /metadocs/1.json
  def show
    @metadoc = Metadoc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @metadoc }
    end
  end

  # GET /metadocs/new
  # GET /metadocs/new.json
  def new
    @metadoc = Metadoc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @metadoc }
    end
  end

  # GET /metadocs/1/edit
  def edit
    @metadoc = Metadoc.find(params[:id])
  end

  # POST /metadocs
  # POST /metadocs.json
  def create
    @metadoc = Metadoc.new(params[:metadoc].merge(:user_id=>session[:uid], :nickname=>current_user.nickname))

    respond_to do |format|
      if @metadoc.save
        #format.html { redirect_to @metadoc, notice: 'Metadoc was successfully created.' }
        format.html { redirect_to metadocs_url }
        format.json { render json: @metadoc, status: :created, location: @metadoc }
      else
        format.html { render action: "new" }
        format.json { render json: @metadoc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /metadocs/1
  # PUT /metadocs/1.json
  def update
    @metadoc = Metadoc.find(params[:id])

    respond_to do |format|
      if @metadoc.update_attributes(params[:metadoc])
        #format.html { redirect_to @metadoc, notice: 'Metadoc was successfully updated.' }
        format.html { redirect_to metadocs_url }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @metadoc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metadocs/1
  # DELETE /metadocs/1.json
  def destroy
    @metadoc = Metadoc.find(params[:id])
    @metadoc.destroy

    respond_to do |format|
      format.html { redirect_to metadocs_url }
      format.json { head :no_content }
    end
  end
end
