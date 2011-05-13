class ImportsController < ApplicationController
  # GET /imports
  # GET /imports.xml
  def index
    imports = Import.find(:all, :order => "id DESC")
    @paginated_imports = imports.paginate :page => params[:page], :per_page => 20

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @imports }
    end
  end

  # GET /imports/1
  # GET /imports/1.xml
  def show
    @import = Import.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @import }
    end
  end

  # GET /imports/new
  # GET /imports/new.xml
  def new
    @import = Import.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @import }
    end
  end

  # GET /imports/1/edit
  def edit
    @import = Import.find(params[:id])
  end

  # POST /imports
  # POST /imports.xml
  def create
    @import = Import.new(params[:import])

    respond_to do |format|
      if @import.save
        format.html { redirect_to(@import, :notice => 'Import was successfully created.') }
        format.xml  { render :xml => @import, :status => :created, :location => @import }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @import.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /imports/1
  # PUT /imports/1.xml
  def update
    @import = Import.find(params[:id])

    respond_to do |format|
      if @import.update_attributes(params[:import])
        format.html { redirect_to(@import, :notice => 'Import was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @import.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /imports/1
  # DELETE /imports/1.xml
  def destroy
    @import = Import.find(params[:id])
    @import.destroy

    respond_to do |format|
      format.html { redirect_to(imports_url) }
      format.xml  { head :ok }
    end
  end

  def parse_source
    require 'excelsior'
    import = Import.find(:first, :order => "id DESC")
    rows = []
    path = RAILS_ROOT + '/public' + import.source.url.split('?').first
    Excelsior::Reader.rows(File.open(path, 'rb')) do |row|
      rows << row
    end

    keys = rows[0]
    sanitized_keys = keys.collect{|key| key.split(' ').first.downcase}
    rows.delete(rows.first)
    
    for row in rows[0..50]
      import_data_hash = {}
      for column in row
        key = sanitized_keys[row.index(column)]
        import_data_hash[key] = column
        if row.index(column) == row.index(row.last)
          import_data_hash = import_data_hash.merge(:import_id => import.id)
          ImportData.create(import_data_hash)
        end
      end
    end

    redirect_to :action => "index"
  end
end
